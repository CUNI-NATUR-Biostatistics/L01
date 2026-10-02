import { lstat, readFile } from "node:fs/promises";
import path from "node:path";

const repositoryRoot = process.cwd();
const pollsliveRoot = path.join(repositoryRoot, "pollslive");
const definitionPath = path.join(pollsliveRoot, "quiz.json");
const configPath = path.join(pollsliveRoot, "config.json");
const definitionKeys = new Set(["$schema", "schemaVersion", "academicYear", "lesson", "quizType", "retrievesLesson", "lectureDate", "title", "questions"]);
const questionKeys = new Set(["id", "text", "options", "correctOptionId", "explanation", "media"]);
const optionKeys = new Set(["id", "label"]);
const mediaKeys = new Set(["path", "alt", "provenance"]);
const configKeys = new Set(["schemaVersion", "clientRepository", "clientRevision", "definition", "documentDirectory", "generatedDirectory", "assetPreparation", "synchronization"]);
const definitionExists = await isRegularFile(definitionPath);
const configExists = await isRegularFile(configPath);

if (!definitionExists && !configExists) {
  console.log("PollsLive adapter is dormant: quiz.json and config.json are absent.");
  process.exit(0);
}

assert(definitionExists && configExists, "PollsLive opt-in requires both pollslive/quiz.json and pollslive/config.json.");

const definition = JSON.parse(await readFile(definitionPath, "utf8"));
const config = JSON.parse(await readFile(configPath, "utf8"));

assertObject(definition, "quiz.json");
rejectUnknownKeys(definition, definitionKeys, "quiz.json");
assert(definition.schemaVersion === 2, "quiz.json schemaVersion must be 2.");
assert(/^\d{4}-\d{2}$/.test(definition.academicYear ?? ""), "quiz.json academicYear must use YYYY-YY.");
const onboarding = definition.quizType === "onboarding";
assert(definition.quizType === undefined || onboarding, "quiz.json quizType, when present, must be onboarding.");
if (onboarding) {
  assert(definition.lesson === "L01", "An onboarding quiz is supported only for L01.");
  assert(!Object.hasOwn(definition, "retrievesLesson"), "An onboarding quiz must not define retrievesLesson.");
} else {
  assert(/^L(0[2-9]|1[0-2])$/.test(definition.lesson ?? ""), "A retrieval quiz lesson must be L02-L12.");
  assert(/^L(0[1-9]|1[01])$/.test(definition.retrievesLesson ?? ""), "quiz.json retrievesLesson must be L01-L11.");
  assert(lessonNumber(definition.lesson) === lessonNumber(definition.retrievesLesson) + 1, "quiz.json retrievesLesson must immediately precede lesson.");
}
assert(isIsoDate(definition.lectureDate), "quiz.json lectureDate must be a real ISO date (YYYY-MM-DD).");
assertText(definition.title, "quiz.json title");
const displayAcademicYear = definition.academicYear.replace("-", "/");
assert(definition.title.includes(definition.academicYear) || definition.title.includes(displayAcademicYear), "quiz.json title must include the academic year.");
assert(!/prototyp/i.test(definition.title), "Production quiz titles must not contain PROTOTYP.");
assert(!Object.hasOwn(definition, "remotePollId"), "Poll identity must remain in the central registry.");
assert(Array.isArray(definition.questions) && definition.questions.length === 3, "quiz.json must contain exactly three questions.");

const questionIds = new Set();
for (const question of definition.questions) {
  assertObject(question, "question");
  rejectUnknownKeys(question, questionKeys, `question ${question.id ?? "<missing>"}`);
  assertId(question.id, "question");
  assert(!questionIds.has(question.id), `Duplicate question id: ${question.id}.`);
  questionIds.add(question.id);
  assertText(question.text, `${question.id}.text`);
  assertText(question.explanation, `${question.id}.explanation`);
  assert(Array.isArray(question.options) && question.options.length >= 2 && question.options.length <= 6, `${question.id} must have 2-6 options.`);
  const optionIds = new Set();
  for (const option of question.options) {
    assertObject(option, `option in ${question.id}`);
    rejectUnknownKeys(option, optionKeys, `option in ${question.id}`);
    assertId(option.id, `${question.id} option`);
    assert(!optionIds.has(option.id), `Duplicate option id in ${question.id}: ${option.id}.`);
    optionIds.add(option.id);
    assertText(option.label, `${question.id}.${option.id}.label`);
  }
  assert(optionIds.has(question.correctOptionId), `${question.id}.correctOptionId must identify one option.`);
  assert(onboarding || (question.media && typeof question.media === "object"), `${question.id} requires evidence media.`);
  if (question.media) {
    rejectUnknownKeys(question.media, mediaKeys, `media in ${question.id}`);
    assertText(question.media.path, `${question.id}.media.path`);
    assertText(question.media.alt, `${question.id}.media.alt`);
    assertText(question.media.provenance, `${question.id}.media.provenance`);
    const mediaPath = path.resolve(pollsliveRoot, question.media.path);
    const relative = path.relative(pollsliveRoot, mediaPath);
    assert(relative && !relative.startsWith("..") && !path.isAbsolute(relative), `${question.id} media must remain below pollslive/.`);
    assert(new Set([".png", ".jpg", ".jpeg", ".webp"]).has(path.extname(mediaPath).toLowerCase()), `${question.id} uses an unsupported media type.`);
    const mediaStatus = await lstat(mediaPath);
    assert(mediaStatus.isFile() && !mediaStatus.isSymbolicLink(), `${question.id} media must be a regular file, not a symlink.`);
  }
}

assertObject(config, "config.json");
rejectUnknownKeys(config, configKeys, "config.json");
assert(config.schemaVersion === 1, "config.json schemaVersion must be 1.");
assert(config.clientRepository === "CUNI-NATUR-Biostatistics/_internal", "config.json must use the canonical client repository.");
assert(/^[a-f0-9]{40}$/.test(config.clientRevision ?? ""), "config.json must pin a complete client revision.");
assert(config.definition === "pollslive/quiz.json", "config.json definition path is invalid.");
assert(config.documentDirectory === "Presentation", "config.json documentDirectory is invalid.");
assert(config.generatedDirectory === "pollslive/generated", "config.json generatedDirectory is invalid.");
assert(JSON.stringify(config.assetPreparation?.command) === JSON.stringify(["Rscript", "R/render_pollslive_assets.R"]), "config.json asset preparation command is invalid.");
assert(config.synchronization?.repository === "CUNI-NATUR-Biostatistics/_internal", "config.json synchronization repository is invalid.");
assert(config.synchronization?.workflow === "pollslive-sync.yml", "config.json synchronization workflow is invalid.");
assert(config.synchronization?.ref === "main", "config.json synchronization ref must be main.");

const serialized = JSON.stringify({ definition, config });
assert(!/(api[_-]?key|edit[_-]?url|management[_-]?url|presenter[_-]?url|session[_-]?token|host[_-]?token|temporary[_-]?code)/i.test(serialized), "PollsLive inputs contain a forbidden secret or management field.");
console.log(`Validated ${definition.lesson} PollsLive definition, configuration, and evidence assets without credentials.`);

async function isRegularFile(filePath) {
  try {
    const status = await lstat(filePath);
    assert(!status.isSymbolicLink(), `${path.relative(repositoryRoot, filePath)} must not be a symlink.`);
    return status.isFile();
  } catch (error) {
    if (error?.code === "ENOENT") return false;
    throw error;
  }
}

function assert(condition, message) {
  if (!condition) throw new Error(message);
}

function assertObject(value, label) {
  assert(value && typeof value === "object" && !Array.isArray(value), `${label} must be an object.`);
}

function rejectUnknownKeys(value, allowed, label) {
  const unknown = Object.keys(value).filter((key) => !allowed.has(key));
  assert(unknown.length === 0, `${label} contains unsupported fields: ${unknown.join(", ")}.`);
}

function lessonNumber(value) {
  return Number(value.slice(1));
}

function isIsoDate(value) {
  if (!/^\d{4}-\d{2}-\d{2}$/.test(value ?? "")) return false;
  const parsed = new Date(`${value}T00:00:00Z`);
  return !Number.isNaN(parsed.valueOf()) && parsed.toISOString().slice(0, 10) === value;
}

function assertText(value, label) {
  assert(typeof value === "string" && value.trim().length > 0, `${label} must be non-empty text.`);
}

function assertId(value, label) {
  assert(typeof value === "string" && /^[a-z0-9][a-z0-9-]*$/.test(value), `${label} id is invalid.`);
}
