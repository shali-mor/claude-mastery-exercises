# Exercise 1-4: Permission Modes & Safety

## Objective
Configure Claude Code permissions correctly for different environments — local dev, team projects, and CI.

---

## Background: The Three Modes

| Mode | Flag | What Claude can do without asking |
|------|------|-----------------------------------|
| `default` | (none) | Nothing risky — always prompts |
| `acceptEdits` | `--permission-mode acceptEdits` | File reads & writes; still prompts for shell commands |
| `bypassPermissions` | `--dangerously-skip-permissions` | Everything — no prompts at all |

> **Rule of thumb:** Use `default` interactively, `acceptEdits` for focused coding sessions, `bypassPermissions` only in isolated CI containers.

---

## Task 1 — Mode matching
Open `starter/scenarios.md` and fill in the correct permission mode for each scenario.

---

## Task 2 — Configure allowed/denied commands
Open `starter/settings-template.json`.

The team has these requirements:
- Claude **can** run `npm test` and `npm run lint` without asking
- Claude **can** run `git add` and `git commit` without asking
- Claude **must always ask** before running `rm`, `git push`, or `git reset`

Fill in the `permissions.allow` and `permissions.deny` arrays using the `Bash(command:*)` pattern.

---

## Task 3 — Write a safe CI script
Open `starter/ci-script.sh`. Fill in the TODO to run Claude in a CI context that:
- Uses the `bypassPermissions` mode (since it's isolated)
- Runs a non-interactive prompt (`-p`) to review all changed files
- Outputs as JSON for downstream parsing
- Exits non-zero if Claude finds critical issues

---

## Task 4 — Observe permission prompts
In your own project directory, start Claude in default mode and ask it to delete a file:
```bash
claude
> Delete the file README.md
```

Observe the permission prompt. Then cancel it (`Ctrl+C` or say no).

Repeat in `acceptEdits` mode:
```bash
claude --permission-mode acceptEdits
> Delete the file README.md
```

**Question:** What difference did you notice?
```
# TODO: Write your observation here

```

---

## Validate
```bash
bash check.sh
```
