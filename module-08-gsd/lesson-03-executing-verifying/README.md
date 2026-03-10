# Lesson 03: Executing & Verifying

Run `/gsd:execute-phase` and then verify the work with `/gsd:verify-work`.

## What you'll build
- An execution log showing atomic commits per task
- A verification report using goal-backward analysis
- A rollback plan for when execution goes wrong

## Key concepts
- `/gsd:execute-phase` executes tasks sequentially with atomic commits
- Each task = one commit with a clear message (`feat:`, `fix:`, `test:`)
- GSD verifier checks that the **phase goal** is achieved, not just that tasks ran
- Verification is goal-backward: "does the codebase now do X?" not "did we run task Y?"
- If verification fails, GSD creates a gap analysis and continues

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
