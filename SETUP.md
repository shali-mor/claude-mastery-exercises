# Setup Guide

## Prerequisites

### 1. Node.js 18+
```bash
node --version  # should be 18 or higher
```
Download from: https://nodejs.org

### 2. Install Claude Code
```bash
npm install -g @anthropic-ai/claude-code
claude --version
```

### 3. Anthropic API Key
1. Go to https://console.anthropic.com
2. Create an API key
3. Set it in your environment:
```bash
export ANTHROPIC_API_KEY="sk-ant-..."
# Add this to your ~/.zshrc or ~/.bashrc to persist it
```

### 4. Authenticate Claude Code
```bash
claude /login
```

### 5. Optional — GitHub CLI (for PR exercises)
```bash
brew install gh   # macOS
gh auth login
```

---

## Verify Everything Works

```bash
cd module-01-basics/lesson-01-getting-started/starter
claude -p "Say hello in one sentence"
```

You should see a response from Claude. You're ready to go!

---

## Troubleshooting

Run the built-in diagnostics:
```bash
claude /doctor
```

This checks your API key, Node version, and network connectivity.
