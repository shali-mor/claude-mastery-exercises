# Automation Prompt Library

## Prompt 1: Email Classifier

**Input**: Raw email text
**Required output**: `{ "category": "...", "priority": "high|medium|low", "summary": "..." }`

```
TODO: Write the prompt. Must:
- Specify exact JSON output format
- Handle edge cases (empty email, non-English, spam)
- Be deterministic and concise
```

---

## Prompt 2: Code Review

**Input**: Git diff text
**Required output**: `{ "issues": [{ "line": N, "severity": "...", "message": "..." }], "approved": true/false }`

```
TODO: Write the prompt
```

---

## Prompt 3: Meeting Notes

**Input**: Meeting transcript
**Required output**: `{ "summary": "...", "action_items": [], "decisions": [] }`

```
TODO: Write the prompt
```

---

## Prompt 4: Sentiment Analyser

**Input**: Product review text
**Required output**: `{ "sentiment": "positive|neutral|negative", "score": 0.0-1.0, "keywords": [] }`

```
TODO: Write the prompt
```

---

## Prompt 5: Release Notes

**Input**: `git log --oneline` output
**Required output**: Markdown with Added / Fixed / Breaking sections

```
TODO: Write the prompt
```
