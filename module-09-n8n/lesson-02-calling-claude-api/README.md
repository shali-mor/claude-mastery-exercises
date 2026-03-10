# Lesson 02: Calling Claude API from n8n

Use the HTTP Request node to stream Claude into your n8n workflows.

## What you'll build
- An n8n workflow configuration (JSON) that calls the Claude API
- A template for the HTTP Request node with correct headers and body
- A response parser that extracts the text from Claude's JSON response

## Key concepts
- Use the **HTTP Request** node (not a Claude-specific node)
- URL: `https://api.anthropic.com/v1/messages`
- Headers: `x-api-key: {{ $credentials.anthropic }}`, `anthropic-version: 2023-06-01`
- Body: `{ model, max_tokens, messages: [{ role, content }] }`
- Parse response: `{{ $json.content[0].text }}`

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
