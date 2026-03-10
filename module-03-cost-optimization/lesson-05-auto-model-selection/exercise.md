# Exercise: Auto Model Selection

## Goal
Create a model-selection system that routes tasks to the right Claude model automatically.

---

## Task 1: Complete the `/pick-model` skill (15 min)

Open `starter/commands/pick-model.md` and implement the scoring rubric:

Each task is scored 0–2 on five dimensions:
| Dimension | 0 | 1 | 2 |
|-----------|---|---|---|
| Complexity | trivial (classify, extract) | moderate | deep reasoning |
| Context size | < 10K tokens | 10–100K | 100K+ |
| Output quality | draft OK | good | publication-quality |
| Latency | background | < 5s | < 1s (streaming) |
| Stakes | low | medium | high (legal, medical, prod) |

**Routing rules** (fill these in the skill):
- Score 0–3 → `claude-haiku-4-5-20251001`
- Score 4–6 → `claude-sonnet-4-6`
- Score 7–10 → `claude-opus-4-6`

The skill should:
1. Score the task described in `$ARGUMENTS`
2. Show the score breakdown table
3. Recommend a model with justification

---

## Task 2: Model guard hook (10 min)

Complete `starter/hooks/model-guard.sh`:
- Receives the Claude session context via stdin (JSON)
- Parse the prompt from `STDIN` using `jq`
- If the prompt mentions `claude-opus` but the task score would be ≤ 3, print a warning and exit 2 (block)

---

## Task 3: Scoring worksheet (5 min)

Open `starter/scoring-worksheet.md` and fill in scores for the 5 sample tasks.

---

## Validation

`bash check.sh`
