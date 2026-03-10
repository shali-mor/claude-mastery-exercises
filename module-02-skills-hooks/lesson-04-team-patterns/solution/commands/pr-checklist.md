# PR Checklist Skill

Review the staged changes and produce a structured PR description.

First, run `git diff --staged` to see what's changing, then `git log --oneline -5` for recent context.

Based on the changes, output a PR description in this exact format:

## Summary
[2-3 bullet points describing what changed and why]

## Test Plan
- [ ] Unit tests pass (`pnpm test`)
- [ ] Manual smoke test: [describe what to click/verify]
- [ ] No regressions in [related feature area]

## Breaking Changes
[Either "None" or a description of breaking changes and migration steps]

---

Also flag any of these concerns if they apply:
- Missing tests for new code paths
- Hardcoded values that should be config
- Performance implications of DB queries
- Security considerations (auth checks, input validation)

$ARGUMENTS
