# Task Tool Invocation Templates

Complete each Task tool call with all required parameters.

---

## Scenario 1: Security audit (background, Haiku)

```
Task tool call:
  subagent_type: TODO
  model: TODO
  run_in_background: TODO
  prompt: |
    TODO: Write a complete self-contained prompt for auditing src/api/auth.ts
    Include: what to look for, what to output, output format
```

---

## Scenario 2: Test generator (sequential, default model)

```
Task tool call:
  subagent_type: TODO
  run_in_background: TODO
  prompt: |
    TODO: Write a complete self-contained prompt for generating Vitest tests
    for src/lib/utils.ts
```

---

## Scenario 3: Doc writer (Sonnet, background)

```
Task tool call:
  subagent_type: TODO
  model: TODO
  run_in_background: TODO
  prompt: |
    TODO: Write a complete self-contained prompt for generating JSDoc
    for all exported functions in src/lib/
```
