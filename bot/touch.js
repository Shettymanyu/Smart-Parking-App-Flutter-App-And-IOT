// Tidy bot: picks one tracked source file and adds or removes a single blank line at
// its end (never touches the code itself), then commits and pushes.
// Run: node bot/touch.js [--test]
const fs = require("fs");
const path = require("path");
const assert = require("assert");
const { execFileSync } = require("child_process");

const ROOT = path.resolve(__dirname, "..");
const CODE = /\.(py|js|ts|dart|html|css)$/;
const SKIP = /^(bot|\.github)\/|(^|\/)(build|node_modules|dist|venv|\.venv)\/|\.min\.|\.g\.dart$/;

const ts = () => new Date().toISOString().replace("T", " ").slice(0, 19);
const log = {
  info: (m) => console.log(`\x1b[36m[${ts()}] [INFO]\x1b[0m ${m}`),
  ok: (m) => console.log(`\x1b[32m[${ts()}] [ OK ]\x1b[0m ${m}`),
  fail: (m) => console.error(`\x1b[31m[${ts()}] [FAIL]\x1b[0m ${m}`),
};

// Runs one step; on error rethrows with the step name so the log says where it broke.
function step(name, fn) {
  log.info(`${name}...`);
  try {
    const result = fn();
    log.ok(name);
    return result;
  } catch (err) {
    throw new Error(`${name} failed: ${err.message}`);
  }
}

const git = (...args) => execFileSync("git", args, { cwd: ROOT, encoding: "utf8" }).trim();

const pickable = (files) => files.filter((f) => CODE.test(f) && !SKIP.test(f));

// Ends with a blank line -> remove it; otherwise add one. Keeps the file's own line endings.
// ponytail: whitespace-only edit, the only change that is safe in every language without parsing.
function toggleBlankLine(text) {
  const eol = text.endsWith("\r\n") ? "\r\n" : "\n";
  return text.endsWith(eol + eol) ? text.slice(0, -eol.length) : text + eol;
}

function main() {
  const files = step("List source files", () => pickable(git("ls-files").split("\n")));
  if (!files.length) throw new Error("no source files found to edit");
  const file = files[Math.floor(Math.random() * files.length)];
  log.info(`File: ${file}`);

  step("Edit file", () => {
    const full = path.join(ROOT, file);
    fs.writeFileSync(full, toggleBlankLine(fs.readFileSync(full, "utf8")));
  });
  step("Commit", () => git("commit", "-am", `style: tidy trailing whitespace in ${file}`));
  step("Push", () => {
    git("pull", "--rebase");
    git("push");
  });

  log.ok(`Done — 1 commit pushed (${file})`);
}

function selfTest() {
  assert.strictEqual(toggleBlankLine("a\n"), "a\n\n");
  assert.strictEqual(toggleBlankLine("a\n\n"), "a\n");
  assert.strictEqual(toggleBlankLine("a\r\n"), "a\r\n\r\n");
  assert.strictEqual(toggleBlankLine(toggleBlankLine("x = 1\n")), "x = 1\n");
  assert.deepStrictEqual(
    pickable(["app.py", "bot/touch.js", "lib/main.dart", "build/x.js", "logo.png", ".github/a.js", "web/app.min.js"]),
    ["app.py", "lib/main.dart"]
  );
  log.ok("Self-test passed");
}

try {
  process.argv.includes("--test") ? selfTest() : main();
} catch (err) {
  log.fail(err.message);
  process.exitCode = 1;
}
