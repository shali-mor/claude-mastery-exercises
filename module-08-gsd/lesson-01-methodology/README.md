# Lesson 01: GSD Methodology & Philosophy

> **GSD is a community-built open-source plugin — not a built-in Claude Code feature.**
> Install it from [github.com/gsd-build/get-shit-done](https://github.com/gsd-build/get-shit-done) (27k+ stars, 2,300+ forks).

Understand the Milestone → Phase → Task hierarchy and why structuring AI work this way produces reliable, verifiable results.

## What you'll build
- A PROJECT.md for a real project using the GSD structure
- A milestone breakdown with 3–4 phases
- A side-by-side comparison of working with and without GSD structure

## Key concepts

### The three-level hierarchy
| Level | Description | Example |
|---|---|---|
| **Milestone** | A major product goal or version | "v1 MVP: URL shortener with analytics" |
| **Phase** | A logical chunk of work | "Phase 2: Auth — sign-up, login, JWT" |
| **Task** | A specific file-level work item | "Create src/lib/auth.ts with signToken()" |

### Why phases beat one big prompt
- Independent tasks within a phase run as **parallel sub-agents** — a 10-task phase completes in ~2–3× sequential time
- If something breaks you know exactly which phase and task failed
- Each phase has acceptance criteria that `/gsd:verify-work` checks before you move on

### The startup sequence
```bash
/gsd:new-project     # GSD interviews you → writes PROJECT.md
/gsd:new-milestone   # Define Milestone 1 → adds it to PROJECT.md
/gsd:plan-phase      # Create PLAN.md for Phase 1
```

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
