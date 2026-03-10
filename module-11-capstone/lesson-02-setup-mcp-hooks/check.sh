#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 02: Setup MCP & Hooks checks ==="

SJ="${WORK}/settings.json"
if [[ ! -f "$SJ" ]]; then bad "settings.json not found"; else
  python3 -c "import json,sys; json.load(open('$SJ'))" 2>/dev/null && ok "settings.json valid" || bad "settings.json invalid"
  grep -q "github\|GITHUB_PERSONAL" "$SJ" && ok "GitHub MCP in settings" || bad "Missing GitHub MCP"
fi

CL="${WORK}/hooks/cache-logger.sh"
if [[ ! -f "$CL" ]]; then bad "hooks/cache-logger.sh not found"; else
  [[ $(grep -c "TODO" "$CL" 2>/dev/null || true) -eq 0 ]] && ok "cache-logger.sh: no TODOs" || bad "cache-logger.sh: has TODOs"
  grep -q "cache\|log" "$CL" && ok "Hook logs cache stats" || bad "Hook missing cache logging"
fi

VE="${WORK}/validate-env.sh"
if [[ ! -f "$VE" ]]; then bad "validate-env.sh not found"; else
  [[ $(grep -c "TODO" "$VE" 2>/dev/null || true) -eq 0 ]] && ok "validate-env.sh: no TODOs" || bad "validate-env.sh: has TODOs"
  grep -q "ANTHROPIC_API_KEY\|GITHUB_PERSONAL" "$VE" && ok "Validates required env vars" || bad "Missing env var checks"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
