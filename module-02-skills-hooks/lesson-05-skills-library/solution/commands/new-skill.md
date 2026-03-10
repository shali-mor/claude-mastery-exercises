# New Skill Generator

Generate a new Claude Code skill from a name and description.

Input format via $ARGUMENTS: `"skill-name: one-line description of what it does"`

Parse the input to extract:
- **name**: the part before the colon (will become the filename and trigger command)
- **description**: the part after the colon

Then output a complete, correctly-formatted skill file:

```markdown
# [Title Case Name]

[Description of what the skill does]

[Main instructions for Claude — what to read, what to analyse, what to output]

$ARGUMENTS
```

After the file content, output:
- **Save to**: `.claude/commands/<name>.md`
- **Invoke with**: `/<name> [optional arguments]`
- **Example**: `/<name> [realistic example input]`

Ensure the skill:
- Has a clear purpose statement in the first paragraph
- Uses `$ARGUMENTS` where the user can pass dynamic input
- Produces actionable, structured output (tables, lists, or code blocks)
