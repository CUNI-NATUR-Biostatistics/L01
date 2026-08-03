-- Convert presentation-style semantic boxes into native Quarto callouts.
-- Native callouts survive both HTML and Typst/PDF rendering, while ordinary
-- fenced-div classes are discarded by Pandoc's Typst writer.

local semantic_types = {
  ["box-question"] = "question",
  ["panel-question"] = "question",
  ["card-question"] = "question",
  ["box-result"] = "important",
  ["panel-result"] = "important",
  ["card-result"] = "important",
  ["card-insight"] = "important",
  ["box-data"] = "tip",
  ["panel-data"] = "tip",
  ["card-data"] = "tip",
  ["box-rule"] = "note",
  ["card-rule"] = "note",
  ["panel-note"] = "note",
  ["box-warning"] = "caution",
  ["panel-warning"] = "caution",
  ["card-warning"] = "caution"
}

local title_classes = {
  ["panel-title"] = true,
  ["panel-lead"] = true,
  ["card-title"] = true
}

local function semantic_type(div)
  for _, class_name in ipairs(div.classes) do
    local callout_type = semantic_types[class_name]
    if callout_type ~= nil then
      return callout_type
    end
  end
  return nil
end

local function filtered_classes(classes)
  local result = pandoc.List()
  for _, class_name in ipairs(classes) do
    if semantic_types[class_name] == nil then
      result:insert(class_name)
    end
  end
  return result
end

local function title_from_first_block(content)
  local first_block = content[1]
  if first_block == nil or first_block.t ~= "Para" then
    return nil
  end

  local first_inline = first_block.content[1]
  if first_inline == nil or first_inline.t ~= "Span" then
    return nil
  end

  for _, class_name in ipairs(first_inline.classes) do
    if title_classes[class_name] then
      content:remove(1)
      return first_inline.content
    end
  end

  return nil
end

local function parse_boolean(value)
  if value == "true" then
    return true
  elseif value == "false" then
    return false
  end
  return nil
end

function Div(div)
  local callout_type = semantic_type(div)
  if callout_type == nil then
    return nil
  end

  local title = div.attributes["title"]
  if title == nil or title == "" then
    title = title_from_first_block(div.content)
  end

  local attributes = {}
  for name, value in pairs(div.attributes) do
    if name ~= "title" and name ~= "collapse" and name ~= "appearance" then
      attributes[name] = value
    end
  end

  return quarto.Callout({
    type = callout_type,
    title = title,
    content = div.content,
    collapse = parse_boolean(div.attributes["collapse"]),
    appearance = div.attributes["appearance"],
    icon = false,
    attr = pandoc.Attr(
      div.identifier,
      filtered_classes(div.classes),
      attributes
    )
  })
end
