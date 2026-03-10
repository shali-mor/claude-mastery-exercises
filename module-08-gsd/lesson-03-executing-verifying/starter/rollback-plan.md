# Rollback Plan

## Scenario
Task 2 went wrong — it introduced a bug. We need to roll back to the state after Task 1.

## Git Commands to Roll Back

```bash
# TODO: Find the commit hash for the end of Task 1
# Hint: git log --oneline

# TODO: Roll back to that commit (keeping working directory clean)
# Hint: git revert or git reset?

# TODO: Verify the rollback worked
```

## Safer Alternative (without losing Task 1 work)
TODO: Describe how you'd use git revert instead of reset

## Prevention
TODO: How would atomic commits (one per task) make this rollback easier?
