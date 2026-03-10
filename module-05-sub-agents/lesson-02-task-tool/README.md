# Lesson 02: Invoking Sub-Agents & Writing Delegation Prompts

Learn to trigger sub-agents from the Claude Code terminal — from a one-liner to a full structured prompt.

## What you'll build
- A set of one-liner invocations for common tasks
- A delegation prompt using the four-section format (Context / Goal / Output Format / Constraints)
- Fixed versions of three broken prompts that are too vague to produce useful results

## Key concepts

### Invoking agents in plain English
You do not write JSON or call any API. You type in the Claude Code chat and Claude calls the Task tool internally:

| What you say | Effect |
|---|---|
| "Use an **Explore** agent" | Fast read-only codebase search |
| "Use a **Bash** agent" | Runs terminal commands |
| "Use a **general-purpose** agent" | Multi-step tasks, writing code |
| "Use **Haiku**" | ~20× cheaper model for simple tasks |
| "Run **in the background**" | Non-blocking — you keep chatting |
| "Use a **worktree**" | Agent gets its own isolated git branch |

### The four-section delegation prompt
For complex tasks, structure your prompt:
- **Context** — what the agent needs to know (stack, paths, prior decisions)
- **Goal** — what "done" looks like (specific and measurable)
- **Output Format** — JSON, markdown list, table (specify exactly)
- **Constraints** — what NOT to do (read-only, scope limits, no new deps)

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
