# Plan Mode Decision Tree

```
Should I use Plan Mode?
         │
         ▼
TODO: Is the task irreversible?
  Yes → TODO
  No  → TODO: next question
```

Complete the decision tree below:

```
[Start]
   │
   ├─ Is the operation irreversible (data deletion, force push, schema migration)?
   │     Yes → TODO
   │     No  → [continue...]
   │
   ├─ TODO: next decision point
   │     Yes → TODO
   │     No  → [continue...]
   │
   ├─ TODO: next decision point
   │
   └─ [End] → TODO: Plan / Skip planning
```

## Decision summary table

| Scenario | Use Plan Mode? |
|----------|---------------|
| Fix a typo | TODO |
| Multi-file refactoring | TODO |
| Add a console.log | TODO |
| Database migration | TODO |
| Experimental feature branch | TODO |
