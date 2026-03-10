# Claude Mastery — Hands-on Exercises

Practice exercises for the [Claude Mastery](https://claude-mastery.com) course.
Every lesson has a structured exercise you complete in the `starter/` folder, then validate with `bash check.sh`.

---

## What's in each lesson

| File/Folder | Purpose |
|-------------|---------|
| `README.md` | Lesson context, key concepts, objectives |
| `exercise.md` | Step-by-step tasks with clear goals |
| `starter/` | Blueprint files with `TODO:` placeholders to fill in |
| `solution/` | Reference implementation (peek when stuck) |
| `check.sh` | Automated validator — run to check your work |

---

## Quick Start

```bash
git clone https://github.com/shali-mor/claude-mastery-exercises.git
cd claude-mastery-exercises

# Pick any lesson and read the exercise
cd module-01-basics/lesson-01-getting-started
cat exercise.md

# Work in the starter/ folder, then validate
bash check.sh
```

---

## Course Structure

### Module 01 — Claude Code Basics
*Master the fundamentals: installation, slash commands, CLI flags, and permission modes.*

| Lesson | Topic | Key Exercise |
|--------|-------|-------------|
| 01 | Getting Started | Generate a `CLAUDE.md`, run first prompts |
| 02 | Slash Commands Deep Dive | Use `/review` on buggy code, match commands to scenarios |
| 03 | CLI Flags & Keyboard Shortcuts | Implement 3 shell scripts using `claude -p` |
| 04 | Permission Modes & Safety | Configure `settings.json`, write a safe CI script |

---

### Module 02 — Skills, Hooks & Commands
*Write custom skills and hooks that automate your team's workflows.*

| Lesson | Topic | Key Exercise |
|--------|-------|-------------|
| 01 | Skills vs Hooks vs Commands | Fix a broken `.claude/` directory, fill decision guide |
| 02 | Writing Skills That Work | Write 4 real skills: `/add-jsdoc`, `/security-review`, `/commit-msg`, `/explain` |
| 03 | Hooks in Practice | Write model-guard, file-audit, and session-reminder hooks |
| 04 | Team Patterns & CLAUDE.md | Build a complete team `CLAUDE.md` + `settings.json` + shared skill |
| 05 | Building a Skills Library | Create a 6-skill library with changelog, debug-plan, refactor-check, env-audit, and meta-skill |

---

### Module 03 — Cost Optimization
*Cut API costs with smart model selection, prompt caching, and the Batch API.*

| Lesson | Topic | Key Exercise |
|--------|-------|-------------|
| 01 | Pricing & Model Selection | Fill in cost calculator, match tasks to models |
| 02 | Prompt Caching | Add `cache_control` to a chatbot — reduce cost by 90% |
| 03 | Context Management | Fill in session workflow guide, implement cost logger |
| 04 | Batch API | Classify 10 support tickets in one batch call, calculate 50% savings |
| 05 | Auto Model Selection | Build `/pick-model` skill with 5-dimension scoring rubric + model-guard hook |

---

### Module 04 — Live API Mastery
*Call the Anthropic API directly from TypeScript with streaming, tool use, and production patterns.*

| Lesson | Topic | Key Exercise |
|--------|-------|-------------|
| 01 | Messages API Fundamentals | First API call + 3-turn multi-turn conversation with system prompt |
| 02 | Streaming Responses | Stream tokens live, add abort support, build SSE Express endpoint |
| 03 | Advanced Techniques | Tool-use agent (weather + calculator), structured JSON extractor |
| 04 | Production Patterns | Resilient client with retry/backoff + cost logger middleware |

---

### Module 05 — Sub-Agents & Parallelism
*Design and delegate work to parallel sub-agents.*

| Lesson | Topic | Key Exercise |
|--------|-------|-------------|
| 01 | What Are Sub-agents? | Classify 5 scenarios: sub-agents vs single call; draw architecture diagram |
| 02 | The Task Tool | Fix 3 bad prompts; write 3 self-contained Task tool invocations |
| 03 | Parallelization | Design 3-agent parallel PR review with fan-out/fan-in + cost analysis |
| 04 | Agent Communication | Define result schema, write sub-agent prompt, build orchestrator handler |

---

### Module 06 — Plan Mode
*Use Plan Mode to explore safely before making irreversible changes.*

| Lesson | Topic | Key Exercise |
|--------|-------|-------------|
| 01 | What Is Plan Mode? | Classify 5 scenarios: plan vs dive in; fill 5-phase workflow |
| 02 | Entering & Exiting | Complete cheat-sheet; build `auto-plan-suggest.sh` hook for risky ops |
| 03 | Plan → Review → Execute | Write a plan, review against checklist, implement refactoring + execution log |
| 04 | When to Use Plan Mode | Decision tree, team policy section for CLAUDE.md, `require-plan.sh` enforcement hook |

---

### Module 07 — MCP (Model Context Protocol)
*Connect Claude to external systems via MCP servers.*

| Lesson | Topic | Key Exercise |
|--------|-------|-------------|
| 01 | What Is MCP? | Fill comparison table (MCP vs skills vs API); configure 2 servers in `settings.json` |
| 02 | Connecting Servers | Configure GitHub + filesystem MCP; write troubleshooting guide |
| 03 | Building a Custom MCP Server | Build a TypeScript todo MCP server with `get_todos` and `create_todo` tools |
| 04 | MCP vs Other Patterns | Decision matrix; scenario mappings; personal integration cheat sheet |

---

### Module 08 — GSD Methodology
*Ship software reliably with the GSD Milestone → Phase → Task framework.*

| Lesson | Topic | Key Exercise |
|--------|-------|-------------|
| 01 | GSD Methodology | Create PROJECT.md with 3-phase milestone, fill vocabulary quiz and command map |
| 02 | Starting a Project & Planning | Write a complete PLAN.md with tasks, commits, and test strategy |
| 03 | Executing & Verifying | Fill execution log, write verification report (goal-backward), rollback plan |
| 04 | Advanced Workflows | Mid-phase pivot procedure, multi-milestone roadmap, team GSD setup guide |

---

### Module 09 — n8n Automation
*Build AI-powered workflows connecting Claude to any service.*

| Lesson | Topic | Key Exercise |
|--------|-------|-------------|
| 01 | n8n Fundamentals | Design a cron → Hacker News → Slack workflow; configure credentials |
| 02 | Calling Claude API | Complete HTTP Request node config; design PR summary workflow |
| 03 | Real-World Workflows | Daily standup generator, support ticket classifier, error handling patterns |
| 04 | Prompt Engineering for Automation | 5-prompt library (email/code/meetings/sentiment/release notes), output validator |

---

### Module 10 — Claude Automation
*Automate Claude with shell scripts, cron, webhooks, and no-code platforms.*

| Lesson | Topic | Key Exercise |
|--------|-------|-------------|
| 01 | Shell Scripts & Cron | Daily code review script, crontab setup, `prepare-commit-msg` git hook |
| 02 | Zapier & Make.com | Zapier Zap design, platform comparison matrix, when-to-use guide |
| 03 | Webhook Automation | Secure HMAC webhook handler, retry queue with exponential backoff |
| 04 | Choosing the Right Tool | ROI calculator for 3 scenarios, personal automation stack recommendation |

---

### Module 11 — Capstone: PR Analysis Pipeline
*Wire everything together: MCP + parallel agents + prompt caching + n8n.*

| Lesson | Topic | Key Exercise |
|--------|-------|-------------|
| 01 | Designing the Pipeline | Full architecture diagram, settings.json with GitHub MCP, cost estimate |
| 02 | Setup — MCP & Hooks | GitHub MCP config, cache-logger hook, environment validator script |
| 03 | Parallel Analysis Agents | 3 agent prompts (security/quality/tests), result aggregator |
| 04 | Wiring & Shipping | Production checklist, monitoring design, end-to-end test plan |

---

### Module 12 — Stock Analysis Bot
*Build a Telegram bot that fetches live market data and delivers Claude-powered analysis.*

| Lesson | Topic | Key Exercise |
|--------|-------|-------------|
| 01 | Architecture Design | System diagram, component spec, RSI/MACD/SMA signal definitions |
| 02 | Telegram Bot Setup | Telegraf bot with `/analyze <ticker>` command, Markdown message formatter |
| 03 | Stock Signals | Yahoo Finance OHLCV fetcher, RSI (14-period), SMA (20/50-day), MACD calculators |
| 04 | Claude as Analyst | Claude analyser with system prompt, full pipeline wiring, end-to-end test script |

---

## Prerequisites

See [SETUP.md](./SETUP.md) for setup instructions (Node.js, TypeScript, API keys).
