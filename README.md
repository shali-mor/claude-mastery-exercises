# Claude Mastery — Exercises

Hands-on exercises to accompany the [Claude Mastery](https://claude-mastery.com) course.

Each lesson folder contains:
- **`README.md`** — lesson context and objectives
- **`exercise.md`** — step-by-step tasks with clear goals
- **`starter/`** — blueprint files with `TODO` placeholders for you to fill in
- **`solution/`** — reference implementation (available on the `solutions` branch)

---

## How to Use

### 1. Clone this repo
```bash
git clone https://github.com/YOUR_ORG/claude-mastery-exercises.git
cd claude-mastery-exercises
```

### 2. Pick a lesson and read the exercise
```bash
cd module-01-basics/lesson-01-getting-started
cat exercise.md
```

### 3. Work in the `starter/` folder
All starter files have `TODO:` markers indicating what you need to fill in.

### 4. Validate your work
Each lesson has a `check.sh` script:
```bash
bash check.sh
```

### 5. Compare with the solution
```bash
git fetch origin solutions
git diff main origin/solutions -- module-01-basics/lesson-01-getting-started/solution/
```

---

## Course Structure

| Module | Topic | Lessons |
|--------|-------|---------|
| 01 | Claude Code Basics | Getting Started, Slash Commands, CLI Flags, Permissions |
| 02 | Skills, Hooks & Commands | Skills vs Hooks, Writing Skills, Hooks in Practice |
| 03 | Cost Optimization | Pricing, Prompt Caching, Context Management |
| 04 | Live API Mastery | Messages API, Streaming, Advanced Techniques |
| 05 | Sub-Agents & Parallelism | Sub-agents, Task Tool, Parallelization |
| 06 | Plan Mode | Plan Mode, Review Workflow, When to Plan |
| 07 | MCP | MCP Basics, Connecting Servers, Custom MCP |
| 08 | Capstone | Full AI Code Review Pipeline |

---

## Prerequisites

See [SETUP.md](./SETUP.md) for setup instructions.
