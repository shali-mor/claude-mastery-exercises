# Permission Mode Scenarios

For each scenario, write the correct permission mode or flag.

---

**Scenario 1:** You're doing a focused 2-hour coding session on a new feature. You want Claude to read and edit files freely, but you still want to approve any shell commands it runs.

```
Mode: # TODO (default | acceptEdits | bypassPermissions)
Flag: # TODO
```

---

**Scenario 2:** You're running Claude in a GitHub Actions workflow inside a Docker container. It needs to run tests, lint, and commit — fully unattended.

```
Mode: # TODO
Flag: # TODO
```

---

**Scenario 3:** You're exploring an unfamiliar codebase for the first time. You want to be prompted for every action Claude takes, including file reads, so you stay fully in control.

```
Mode: # TODO
Flag: # TODO
```

---

**Scenario 4:** Your team runs Claude as a local pre-commit checker. It reads changed files and outputs a report, but never modifies anything.

```
Mode: # TODO  (acceptEdits is overkill — why?)
Explanation: # TODO
```

---

**Scenario 5:** A junior developer is pairing with Claude and might not notice if Claude makes unintended changes. Which mode is safest?

```
Mode: # TODO
Reason: # TODO
```
