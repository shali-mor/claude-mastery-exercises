# Lesson 2-6: Memory & Context — How Claude Remembers

**Module:** Skills, Hooks & Commands
**Estimated time:** 15 minutes
**Course link:** Module 2 → Lesson 6

## What you'll practice

- Setting up the four memory layers correctly
- Writing a global CLAUDE.md for personal preferences
- Writing a project CLAUDE.md for team-shared context
- Knowing when to use `/compact` vs `/clear` vs `/context`
- Asking Claude to auto-remember facts across sessions

## The four memory layers (quick reference)

| Layer | Where | Scope | Best for |
|-------|-------|-------|----------|
| Global CLAUDE.md | `~/.claude/CLAUDE.md` | All your projects | Personal style, preferred tools |
| Project CLAUDE.md | `.claude/CLAUDE.md` | All team members, every session | Stack, conventions, do-nots |
| Auto-memory | `~/.claude/projects/<hash>/memory/` | Persists per project | Facts Claude discovers mid-session |
| Context window | Live conversation | Current session only | Everything Claude is working with now |

## Files in this lesson

```
starter/
  global-claude.md          ← TODO: write your personal global CLAUDE.md
  project-claude.md         ← TODO: add an architecture decision to this template
  context-scenarios.md      ← TODO: pick the right command for each scenario
solution/
  global-claude.md
  project-claude.md
  context-scenarios.md
```

## Tasks

### Task 1 — Write your global CLAUDE.md

Create `~/.claude/CLAUDE.md` on your machine. It should express *your* preferences, not any project's.

Must include:
- Response style (concise vs detailed, how you like code shown)
- Tools you always have installed (package manager, CLI tools)
- At least one convention you apply across all your projects

Open `starter/global-claude.md` for the template.

### Task 2 — Add an architecture decision to a project CLAUDE.md

Open `starter/project-claude.md`. It has a skeleton CLAUDE.md for a TypeScript project.

Add a real (or realistic) architecture decision your team has made, following this format:

```markdown
## Architecture decisions
- [Decision]: [what you chose and why]
  Rationale: [one sentence]
  Do not: [what Claude should never do that contradicts this]
```

### Task 3 — Context window scenarios

Open `starter/context-scenarios.md`. For each situation, write which command to use and why:

| Situation | Command | Why |
|-----------|---------|-----|
| You've been working for 2 hours and /cost shows 80K tokens used, but you want to keep going on the same task | ? | ? |
| You just finished fixing a bug and now want to start a completely unrelated refactor | ? | ? |
| You want to see how full the context window is before deciding | ? | ? |
| Claude keeps referencing an old approach you abandoned an hour ago | ? | ? |
| You want to branch off and try a different solution without losing the current path | ? | ? |

### Task 4 — Auto-memory practice

In a Claude Code session, tell Claude:

> "Remember that in this project we always use named exports, never default exports. This is a team rule."

Then start a **new session** in the same project and verify Claude knows the rule without you repeating it.

Bonus: Run `/memory` to see where that fact was stored.

## Solution

See `solution/` for reference answers on Tasks 1–3. Task 4 requires a live Claude Code session.
