#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 02: Telegram Bot checks ==="

BT="${WORK}/bot.ts"
if [[ ! -f "$BT" ]]; then bad "bot.ts not found"; else
  [[ $(grep -c "TODO" "$BT" 2>/dev/null || true) -eq 0 ]] && ok "bot.ts: no TODOs" || bad "bot.ts: has TODOs"
  grep -q "telegraf\|Telegraf" "$BT" && ok "Uses telegraf" || bad "Missing telegraf import"
  grep -q "command\|analyze\|analyse" "$BT" && ok "Handles /analyze command" || bad "Missing /analyze handler"
fi

FT="${WORK}/formatter.ts"
if [[ ! -f "$FT" ]]; then bad "formatter.ts not found"; else
  [[ $(grep -c "TODO" "$FT" 2>/dev/null || true) -eq 0 ]] && ok "formatter.ts: no TODOs" || bad "formatter.ts: has TODOs"
  grep -q "RSI\|MACD\|SMA\|Price" "$FT" && ok "Formatter includes signal fields" || bad "Formatter missing signal fields"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
