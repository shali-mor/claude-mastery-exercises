# Delegation Prompt: Add Input Validation

Use an isolated general-purpose agent (worktree) to add zod input validation
to all API routes in src/app/api/users/.

## Context
This is a Next.js 14 app using the App Router.
API routes live in src/app/api/users/.
The `zod` package is already installed.

## Goal
For each route file in src/app/api/users/, add zod schema validation to the
request body. Every POST/PUT/PATCH route must validate its body before processing.
A route is "done" when it parses and validates the request body using zod and
returns a 400 response with a descriptive error if validation fails.

## Constraints
- Only modify files inside src/app/api/users/
- Do not install new packages
- Do not modify any files outside that directory

## Output Format
When done, return a list:
- src/app/api/users/route.ts — [one-line description of what was added]
- src/app/api/users/[id]/route.ts — [one-line description]
(one line per file modified)

## If Blocked
If a route file already has validation, note it and skip it.
