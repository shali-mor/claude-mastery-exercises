# Changelog Generator

Generate a CHANGELOG entry for version $ARGUMENTS.

1. Run `git describe --tags --abbrev=0` to find the last release tag
2. Run `git log --oneline <last-tag>..HEAD` to get all commits since then
3. Categorise each commit into one of these sections based on its message:
   - **Added** — new features (`feat:`, `add`, `new`)
   - **Changed** — updates to existing behaviour (`refactor:`, `update`, `improve`)
   - **Fixed** — bug fixes (`fix:`, `bugfix:`, `patch:`)
   - **Breaking** — anything with `BREAKING CHANGE` or `!` in conventional commits
4. Output this Markdown block, ready to paste into CHANGELOG.md:

```markdown
## [$ARGUMENTS] — YYYY-MM-DD

### Added
- ...

### Changed
- ...

### Fixed
- ...

### Breaking Changes
- ...
```

Skip any commits that are purely chores (ci:, chore:, docs:) unless asked.
