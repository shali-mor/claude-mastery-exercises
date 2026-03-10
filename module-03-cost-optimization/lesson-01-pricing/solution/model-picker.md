# Model Picker — Solutions

**Task 1:** Classify 100K reviews.
```
Model: Haiku 4.5
Reason: Simple classification task, high volume — Haiku is 19x cheaper than Opus
and handles straightforward classification excellently.
```

**Task 2:** Complex system architecture.
```
Model: Opus 4.6
Reason: Requires deep reasoning, trade-off analysis, and handling ambiguity.
This is exactly what Opus excels at, and you'll run it rarely (once per design session).
```

**Task 3:** Commit messages in CI, 200x/day.
```
Model: Haiku 4.5
Reason: Commit message generation is a well-structured, repeatable task.
High frequency + simple task = Haiku wins on cost.
```

**Task 4:** Interactive coding for senior engineer.
```
Model: Sonnet 4.6
Reason: Complex enough to need Sonnet's capability, but not so rare/complex
that Opus is warranted. Best balance of speed, quality, and cost for daily use.
```

**Task 5:** Extract structured data from 10K invoices overnight.
```
Model: Haiku 4.5 (or Sonnet if accuracy is critical)
Reason: Structured extraction is well-defined. Haiku handles it well.
If invoice formats vary significantly, move to Sonnet.
```

**Task 6:** Write a technical design document interactively.
```
Model: Sonnet 4.6 (or Opus for very complex domains)
Reason: Interactive writing needs good reasoning and coherence.
Sonnet is the right default; upgrade to Opus only if the domain is highly complex.
```
