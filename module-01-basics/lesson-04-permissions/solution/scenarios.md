# Permission Mode Scenarios — Solutions

**Scenario 1:** Focused coding session, approve shell commands.
```
Mode: acceptEdits
Flag: --permission-mode acceptEdits
```

**Scenario 2:** GitHub Actions, fully unattended in Docker.
```
Mode: bypassPermissions
Flag: --dangerously-skip-permissions
```

**Scenario 3:** Exploring unfamiliar codebase, full control.
```
Mode: default
Flag: (none — default mode)
```

**Scenario 4:** Read-only pre-commit checker.
```
Mode: default
Explanation: acceptEdits is overkill because the tool never needs to write files.
default mode is safest and still non-interactive when using -p flag.
```

**Scenario 5:** Junior developer pairing — safest mode.
```
Mode: default
Reason: Every action requires explicit approval, giving the junior dev
full visibility and control over what Claude does.
```
