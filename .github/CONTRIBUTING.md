# Contributing

## Adding a new exercise

1. Create the lesson folder: `module-XX-topic/lesson-YY-name/`
2. Add the required files:
   - `README.md` — lesson context and file map
   - `exercise.md` — numbered tasks
   - `starter/` — blueprint files with `TODO` markers
   - `solution/` — reference implementation
   - `check.sh` — automated validator
3. Open a PR — the exercise will be reviewed for clarity and correctness

## check.sh conventions

- Use `[PASS]` / `[FAIL]` prefixes
- Exit `0` if all checks pass, `1` if any fail
- Checks should be fast (< 5 seconds) and have no external dependencies
- Test that `TODO` markers are removed and key patterns exist

## Style guide

- `TODO:` (with colon) in starter files marks what students must fill in
- Solution files must not contain any `TODO` markers
- Keep exercise tasks numbered and independent where possible
- Each task should be completable in 2-5 minutes
