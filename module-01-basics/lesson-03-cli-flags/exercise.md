# Exercise 1-3: CLI Flags & Keyboard Shortcuts

## Objective
Use Claude Code as a scriptable CLI tool, not just an interactive assistant.

---

## Task 1 — One-off prompt with file input
Run Claude non-interactively on a single file:
```bash
claude -p "What does this file do? Answer in 2 sentences." < starter/sample-code/server.ts
```

**Goal:** Get a 2-sentence summary. Note the speed — no session startup overhead.

---

## Task 2 — JSON output for pipelines
Run the same prompt but request JSON output:
```bash
claude --output-format json -p "List the exported functions in this file as a JSON array of strings." < starter/sample-code/server.ts
```

**Goal:** Parse the JSON output to understand the structure Claude returns.

---

## Task 3 — Implement summarize.sh
Open `starter/scripts/summarize.sh`. It has a `TODO` where you need to write a `claude -p` command that:
- Accepts a filename as `$1`
- Pipes the file content to Claude
- Asks Claude for a one-paragraph summary
- Prints the result

Fill in the TODO, then test it:
```bash
bash starter/scripts/summarize.sh starter/sample-code/routes.ts
```

---

## Task 4 — Implement review-files.sh
Open `starter/scripts/review-files.sh`. Fill in the TODO to:
- Loop over all `.ts` files passed as arguments
- Run `claude -p "Review this file for bugs and security issues"` on each
- Print the filename as a header before each review

Test it:
```bash
bash starter/scripts/review-files.sh starter/sample-code/*.ts
```

---

## Task 5 — Implement extract-todos.sh
Open `starter/scripts/extract-todos.sh`. Fill in the TODO to:
- Find all `TODO` comments in `*.ts` files in the given directory
- Pass them to Claude asking it to prioritize them by importance
- Output the prioritized list

Test it:
```bash
bash starter/scripts/extract-todos.sh starter/sample-code
```

---

## Validate
```bash
bash check.sh
```
