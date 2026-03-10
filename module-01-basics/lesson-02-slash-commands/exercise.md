# Exercise 1-2: Slash Commands Deep Dive

## Objective
Build muscle memory for the most important slash commands by using them in realistic scenarios.

---

## Task 1 — Check session cost
Start a Claude session in this lesson folder:
```bash
cd starter/buggy-project
claude
```

Ask Claude several questions about the code. Then run:
```
/cost
```

Write down the token counts you see:
```
# TODO: Fill in after running /cost
Input tokens:
Output tokens:
Estimated cost:
```

---

## Task 2 — Compact the session
Without leaving the session, run:
```
/compact
```

Then immediately run `/cost` again.

**Question:** How much did the input token count drop?
```
# TODO: Fill in
Before compact:
After compact:
Reduction:
```

---

## Task 3 — Check session status
Run:
```
/status
```

**Goal:** Identify and write down:
```
# TODO: Fill in
Active model:
Permission mode:
CLAUDE.md loaded: (yes/no)
MCP servers: (none or list)
```

---

## Task 4 — Switch models mid-session
Switch to Haiku for a cheap, simple task:
```
/model claude-haiku-4-5-20251001
```

Ask it: "List the files in this project in one line."

Then switch back to Sonnet:
```
/model claude-sonnet-4-6
```

**Goal:** Notice the speed difference. Haiku should respond significantly faster.

---

## Task 5 — Review the buggy code
The `starter/buggy-project/` has intentional issues. Run:
```
/review
```

**Goal:** Copy the issues Claude identifies into the space below:
```
# TODO: Fill in — paste Claude's /review output here



```

---

## Task 6 — Match scenarios to commands
Open `starter/scenarios.md` and fill in the correct slash command for each scenario.

---

## Validate
```bash
bash check.sh
```
