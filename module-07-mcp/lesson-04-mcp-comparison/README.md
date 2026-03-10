# Lesson 04: MCP vs Other Integration Patterns

Choose the right integration pattern for each use case.

## What you'll build
- A decision matrix comparing MCP, skills, hooks, and direct API calls
- A use-case mapping for real-world scenarios
- Your personal integration pattern cheat sheet

## Key concepts
- **MCP**: best for stateful external systems (databases, file trees, APIs with auth)
- **Skills**: best for repeatable Claude Code workflows (PR review, changelog generation)
- **Hooks**: best for policy enforcement and side effects (logging, blocking, notifications)
- **Direct API**: best for programmatic use in your own applications
- The patterns can combine: a skill can trigger an MCP tool, a hook can call an API

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
