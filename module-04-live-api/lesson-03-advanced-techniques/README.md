# Lesson 03: Advanced API Techniques

Master tool use, vision, and structured outputs for production-grade applications.

## What you'll build
- A tool-use agent that calls functions (weather, calculator)
- A vision pipeline that analyses images
- A structured JSON extractor using constrained output

## Key concepts
- Tool use: define tools in `tools[]`, Claude returns `tool_use` blocks, you execute and return results
- Vision: pass images as `{ type: 'image', source: { type: 'base64', ... } }` in the content array
- Structured output: use a `json_schema` tool to force Claude to return valid JSON every time

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
