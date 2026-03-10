---
description: Review the current git diff for security vulnerabilities
---

# /security-review

Review the current git diff for security vulnerabilities.

Run `git diff` first to get the changes.

Check for:
- SQL injection (unsanitised inputs in queries)
- XSS (unescaped output in HTML or templates)
- Exposed secrets (API keys, tokens, passwords in source)
- Insecure direct object references (missing ownership checks)
- Missing authentication on API routes
- Insecure password hashing (MD5, SHA1, plain text)
- Command injection (user input in shell commands)

For each issue found, output:
1. **File**: filename and line number
2. **Issue**: one-sentence description
3. **Severity**: Low | Medium | High | Critical
4. **Fix**: concrete code or approach to resolve it

If no issues are found, say: "No security issues found in this diff."
