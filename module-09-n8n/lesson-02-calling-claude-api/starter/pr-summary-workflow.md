# PR Summary n8n Workflow Design

## Trigger
Node type: TODO
Event: TODO (which GitHub webhook event?)
Configuration: TODO

## Node 2: Extract PR diff
Node type: TODO
Expression to get diff URL: TODO
Expression to get PR number: TODO

## Node 3: Fetch diff content
Node type: TODO
URL: TODO (GitHub API URL for the diff)
Headers needed: TODO

## Node 4: Call Claude
Node type: HTTP Request
Prompt template:
```
TODO: Write the prompt that summarises a PR diff
Input: {{ $json.diff }}
```

## Node 5: Post PR comment
Node type: TODO
URL: TODO (GitHub API URL for PR comments)
Body: TODO
