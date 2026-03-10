# Exercise 1-1: Getting Started with Claude Code

## Objective
Get Claude Code installed, authenticated, and running your first prompts.

---

## Task 1 — Install & verify
Run the following and confirm the output shows a version number:
```bash
npm install -g @anthropic-ai/claude-code
claude --version
```

**Expected:** a version string like `1.x.x`

---

## Task 2 — Start your first session
Navigate to the starter sample project and open Claude Code:
```bash
cd starter/sample-project
claude
```

Once inside, run:
```
/help
```

**Goal:** Identify 3 commands from the help output that you think you'll use most. Write them in the space below:

```
# TODO: List 3 commands here
1.
2.
3.
```

---

## Task 3 — Generate a CLAUDE.md
Still inside the session, run:
```
/init
```

Claude will analyse the project and generate a `CLAUDE.md` file.

**Goal:** Open the generated file and make sure it contains:
- [ ] The tech stack
- [ ] At least one convention or rule
- [ ] Key file paths

If anything is missing, edit the file to add it manually.

---

## Task 4 — Complete the CLAUDE.md template
Open `starter/CLAUDE.md.template`. Fill in every `TODO:` section with accurate information about the sample project.

---

## Task 5 — Run a non-interactive prompt
Without starting a full session, run:
```bash
claude -p "In one sentence, what does the utils.js file do?" < starter/sample-project/utils.js
```

**Goal:** Get a one-sentence answer from Claude using the `-p` flag (non-interactive mode).

---

## Validate
```bash
bash check.sh
```
