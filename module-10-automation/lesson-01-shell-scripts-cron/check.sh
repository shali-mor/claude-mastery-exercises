#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 01: Shell Scripts & Cron checks ==="

DR="${WORK}/daily-review.sh"
if [[ ! -f "$DR" ]]; then bad "daily-review.sh not found"; else
  [[ $(grep -c "TODO" "$DR" 2>/dev/null || true) -eq 0 ]] && ok "daily-review.sh: no TODOs" || bad "daily-review.sh: has TODOs"
  grep -q "claude -p\|claude --print" "$DR" && ok "Uses claude -p" || bad "Missing claude -p"
  grep -q "git diff\|git log" "$DR" && ok "Uses git to find changes" || bad "Missing git command"
fi

CT="${WORK}/crontab.txt"
if [[ ! -f "$CT" ]]; then bad "crontab.txt not found"; else
  [[ $(grep -c "TODO" "$CT" 2>/dev/null || true) -eq 0 ]] && ok "crontab.txt: no TODOs" || bad "crontab.txt: has TODOs"
  [[ $(grep -v "^#" "$CT" | grep -c "." 2>/dev/null || true) -ge 3 ]] && ok "crontab.txt has 3+ entries" || bad "crontab.txt has fewer than 3 entries"
fi

HK="${WORK}/hooks/prepare-commit-msg"
if [[ ! -f "$HK" ]]; then bad "hooks/prepare-commit-msg not found"; else
  [[ $(grep -c "TODO" "$HK" 2>/dev/null || true) -eq 0 ]] && ok "prepare-commit-msg: no TODOs" || bad "prepare-commit-msg: has TODOs"
  grep -q "claude" "$HK" && ok "Hook uses claude" || bad "Hook missing claude call"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
