# Lesson 03: Real-World n8n Workflows

Build three production-ready workflows for common developer automation scenarios.

## What you'll build
- A daily standup generator (reads git log, formats standup with Claude)
- A support ticket classifier (webhook → Claude → label in Jira/Linear)
- A PR review assistant (GitHub webhook → Claude analysis → PR comment)

## Key concepts
- Chain nodes: webhook → data transform → Claude → action
- Error handling: add Error Trigger nodes for failed workflow runs
- Rate limiting: add Wait nodes to stay under API limits
- Test mode: use "Execute node" to test individual nodes without running the whole workflow
- Expressions: `{{ $json.field }}`, `{{ $node["NodeName"].json.field }}`

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
