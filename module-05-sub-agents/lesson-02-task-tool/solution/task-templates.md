# Task Tool Invocation Templates

## Scenario 1: Security audit (background, Haiku)

```
Task tool call:
  subagent_type: general-purpose
  model: claude-haiku-4-5-20251001
  run_in_background: true
  prompt: |
    Security audit task: Read the file src/api/auth.ts and check for these specific vulnerabilities:
    1. SQL injection — any string interpolation into queries
    2. Missing authentication checks — routes that should require auth but don't
    3. Exposed secrets — hardcoded API keys, passwords, or tokens
    4. Weak JWT validation — missing expiry checks, algorithm confusion

    For each issue found, output:
    - Severity: HIGH / MEDIUM / LOW
    - Line number(s)
    - Description of the vulnerability
    - Recommended fix

    If no issues found in a category, write "None found".
    Format your output as a Markdown report.
```

## Scenario 2: Test generator (sequential, default model)

```
Task tool call:
  subagent_type: general-purpose
  run_in_background: false
  prompt: |
    Generate comprehensive Vitest unit tests for the file src/lib/utils.ts.

    First, read the file to understand all exported functions.
    Then write tests that cover:
    - Happy path for each function
    - Edge cases (empty input, null, undefined, boundary values)
    - Error cases (invalid input types)

    Use Vitest syntax (describe, it, expect). Mock external dependencies.
    Output the complete test file content for src/lib/utils.test.ts.
```

## Scenario 3: Doc writer (Sonnet, background)

```
Task tool call:
  subagent_type: general-purpose
  model: claude-sonnet-4-6
  run_in_background: true
  prompt: |
    Generate JSDoc comments for all exported functions in the src/lib/ directory.

    Steps:
    1. List all .ts files in src/lib/
    2. For each file, read it and identify all exported functions, classes, and types
    3. Generate JSDoc with: @description, @param (with types), @returns, @example

    Output a diff-style patch showing exactly where to insert each JSDoc block,
    or output the complete updated file content for each file.
    Prioritise accuracy over brevity — examples should be realistic.
```
