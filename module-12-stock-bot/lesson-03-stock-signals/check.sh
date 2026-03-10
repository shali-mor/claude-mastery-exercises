#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 03: Stock Signals checks ==="

FT="${WORK}/fetcher.ts"
if [[ ! -f "$FT" ]]; then bad "fetcher.ts not found"; else
  [[ $(grep -c "TODO" "$FT" 2>/dev/null || true) -eq 0 ]] && ok "fetcher.ts: no TODOs" || bad "fetcher.ts: has TODOs"
  grep -q "yahoo\|finance\|fetch" "$FT" && ok "Fetches from Yahoo Finance" || bad "Missing Yahoo Finance fetch"
fi

for ind in rsi sma; do
  F="${WORK}/indicators/${ind}.ts"
  if [[ ! -f "$F" ]]; then bad "${ind}.ts not found"; else
    [[ $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "${ind}.ts: no TODOs" || bad "${ind}.ts: has TODOs"
    grep -q "return\|export" "$F" && ok "${ind}.ts returns a value" || bad "${ind}.ts missing return"
  fi
done

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
