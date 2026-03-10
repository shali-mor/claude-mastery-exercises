# Lesson 04: Prompt Engineering for Automation

Write prompts that work reliably in automated n8n workflows (no human in the loop).

## What you'll build
- A prompt template library for 5 common automation scenarios
- A structured output enforcer (forcing JSON from Claude)
- A prompt test harness that validates Claude's output format

## Key concepts
- Automation prompts must be deterministic — no ambiguity
- Always specify: output format, length limits, fallback if input is unclear
- Force JSON output: "Respond ONLY with valid JSON matching this schema: ..."
- Test your prompts with edge cases before deploying the workflow
- Use `claude-haiku-4-5-20251001` for high-volume automation (cost-effective)

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
