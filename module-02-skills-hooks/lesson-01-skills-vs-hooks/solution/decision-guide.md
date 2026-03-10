# Decision Guide — Solutions

**1.** Automatic file write logging.
```
Tool: hook (PostToolUse)
Reason: Needs to fire automatically on a Claude Code event, with no user input.
```

**2.** Repeated security review prompt.
```
Tool: skill (.claude/commands/security-review.md)
Reason: A repeatable prompt the user invokes manually with /security-review.
```

**3.** Wipe conversation context.
```
Tool: built-in command (/clear or /reset)
Reason: This is a standard Claude Code action — already built in.
```

**4.** Auto-check tests before git push.
```
Tool: hook (PreToolUse, matching Bash tool with git push)
Reason: Must fire automatically before the action, with no user input required.
```

**5.** Generate conventional commit message.
```
Tool: skill (.claude/commands/commit-msg.md)
Reason: User-invoked repeatable workflow — /commit-msg.
```

**6.** Check active model and MCP servers.
```
Tool: built-in command (/status)
Reason: Already built in to Claude Code.
```

**7.** Print open GitHub issues at session start.
```
Tool: hook (SessionStart)
Reason: Needs to fire automatically when the session begins, without user input.
```

**8.** Block prompts containing "delete".
```
Tool: hook (UserPromptSubmit, exit 2 to block)
Reason: Must intercept every prompt automatically — a skill can't guard itself.
```
