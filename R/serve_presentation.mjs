import { spawn } from "node:child_process";
import { readFile } from "node:fs/promises";
import { createServer } from "node:http";
import path from "node:path";
import { pathToFileURL } from "node:url";

export async function startPresentationServer({
  htmlPath = path.resolve("Presentation", "presentation.html"),
  host = "127.0.0.1",
  port = 8765,
  openBrowser = true
} = {}) {
  await readFile(htmlPath);
  const server = createServer(async (request, response) => {
    const pathname = new URL(request.url ?? "/", "http://localhost").pathname;
    if (request.method === "GET" || request.method === "HEAD") {
      if (pathname === "/" || pathname === "/presentation.html") {
        const html = await readFile(htmlPath);
        response.writeHead(200, {
          "Content-Type": "text/html; charset=utf-8",
          "Cache-Control": "no-store"
        });
        response.end(request.method === "HEAD" ? undefined : html);
        return;
      }
      if (pathname === "/favicon.ico") {
        response.writeHead(204);
        response.end();
        return;
      }
    }
    response.writeHead(404, { "Content-Type": "text/plain; charset=utf-8" });
    response.end("Not found");
  });

  await new Promise((resolve, reject) => {
    server.once("error", reject);
    server.listen(port, host, resolve);
  });

  const address = server.address();
  const url = `http://${host}:${address.port}/presentation.html`;
  if (openBrowser) openInBrowser(url);
  return { server, url };
}

function openInBrowser(url) {
  const platform = process.platform;
  const command = platform === "win32"
    ? process.env.ComSpec ?? "cmd.exe"
    : platform === "darwin"
      ? "open"
      : "xdg-open";
  const args = platform === "win32" ? ["/d", "/s", "/c", "start", "", url] : [url];
  const child = spawn(command, args, {
    detached: true,
    stdio: "ignore",
    windowsHide: true
  });
  child.unref();
}

function readCliOptions(args) {
  const portIndex = args.indexOf("--port");
  const port = portIndex >= 0 ? Number(args[portIndex + 1]) : 8765;
  if (!Number.isInteger(port) || port < 0 || port > 65535) {
    throw new Error("--port must be an integer between 0 and 65535.");
  }
  return {
    port,
    openBrowser: !args.includes("--no-browser")
  };
}

if (process.argv[1] && pathToFileURL(path.resolve(process.argv[1])).href === import.meta.url) {
  const options = readCliOptions(process.argv.slice(2));
  const { server, url } = await startPresentationServer(options);
  console.log(`Serving the presentation at ${url}`);
  console.log("Press Ctrl+C to stop the presenter server.");
  const close = () => server.close(() => process.exit(0));
  process.once("SIGINT", close);
  process.once("SIGTERM", close);
}
