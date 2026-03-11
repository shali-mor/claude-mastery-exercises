#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 05: Worktree Isolation checks ==="

# ── Task 1: delegation-prompt.md ──────────────────────────────────────────
DP="${WORK}/delegation-prompt.md"
if [[ ! -f "$DP" ]]; then
  bad "delegation-prompt.md not found"
else
  [[ $(grep -c "TODO" "$DP" 2>/dev/null || true) -eq 0 ]] \
    && ok "delegation-prompt.md: no TODOs remaining" \
    || bad "delegation-prompt.md: still has TODO placeholders"

  grep -qi "worktree\|isolated\|isolation" "$DP" \
    && ok "Prompt requests worktree isolation" \
    || bad "Prompt does not request worktree isolation (add 'worktree' or 'isolated')"

  grep -qi "src/app/api/users" "$DP" \
    && ok "Prompt scopes agent to users/ directory" \
    || bad "Prompt does not scope agent to src/app/api/users/"

  grep -qi "zod\|validat" "$DP" \
    && ok "Prompt mentions validation goal" \
    || bad "Prompt missing validation goal"
fi

echo ""

# ── Task 2: worktree-workflow.sh ──────────────────────────────────────────
WF="${WORK}/worktree-workflow.sh"
if [[ ! -f "$WF" ]]; then
  bad "worktree-workflow.sh not found"
else
  [[ $(grep -c "TODO" "$WF" 2>/dev/null || true) -eq 0 ]] \
    && ok "worktree-workflow.sh: no TODOs remaining" \
    || bad "worktree-workflow.sh: still has TODO placeholders"

  grep -q "git worktree list" "$WF" \
    && ok "Step 1: lists worktrees correctly" \
    || bad "Step 1: missing 'git worktree list'"

  grep -q "git diff.*main\.\.\." "$WF" \
    && ok "Step 2: reviews diff with three-dot syntax" \
    || bad "Step 2: missing 'git diff main...' (use three-dot syntax)"

  grep -q "cd.*worktrees\|cd.*agent" "$WF" \
    && ok "Step 3: navigates into worktree directory" \
    || bad "Step 3: missing cd into the worktree path"

  grep -q "git merge.*worktree/" "$WF" \
    && ok "Step 4: merges the worktree branch" \
    || bad "Step 4: missing 'git merge worktree/<branch>'"

  grep -q "git worktree remove" "$WF" \
    && ok "Step 5: removes the worktree" \
    || bad "Step 5: missing 'git worktree remove'"
fi

echo ""

# ── Task 3: parallel-worktrees-prompt.md ─────────────────────────────────
PP="${WORK}/parallel-worktrees-prompt.md"
if [[ ! -f "$PP" ]]; then
  bad "parallel-worktrees-prompt.md not found"
else
  [[ $(grep -c "TODO" "$PP" 2>/dev/null || true) -eq 0 ]] \
    && ok "parallel-worktrees-prompt.md: no TODOs remaining" \
    || bad "parallel-worktrees-prompt.md: still has TODO placeholders"

  grep -qi "worktree\|isolated" "$PP" \
    && ok "Parallel prompt uses isolation" \
    || bad "Parallel prompt does not request isolation"

  # Count how many of the three directories are mentioned
  COUNT=0
  grep -qi "users" "$PP"   && ((COUNT++)) || true
  grep -qi "payments" "$PP" && ((COUNT++)) || true
  grep -qi "auth" "$PP"    && ((COUNT++)) || true
  [[ $COUNT -ge 3 ]] \
    && ok "Prompt targets all 3 API directories" \
    || bad "Prompt missing some API directories (need users, payments, auth) — found $COUNT/3"

  grep -qi "parallel\|simultaneously\|at once\|in parallel" "$PP" \
    && ok "Prompt requests parallel execution" \
    || bad "Prompt does not indicate parallel execution"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
