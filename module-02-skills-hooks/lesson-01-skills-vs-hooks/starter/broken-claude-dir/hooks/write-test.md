# write-test.md — in the wrong place!
#
# PROBLEM: This is a skill (a Markdown prompt file) sitting in hooks/.
# Hooks must be shell scripts (.sh) registered in settings.json.
# A .md file in hooks/ will be ignored.
#
# This belongs in .claude/commands/write-test.md

Write a comprehensive test file for $ARGUMENTS.

Use the project's existing test framework. Cover:
- Happy path
- Edge cases
- Error conditions

Do not modify the source file.
