#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 01: What Is MCP checks ==="

for f in comparison.md architecture.md; do
  F="${WORK}/${f}"
  [[ -f "$F" && $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "${f}: completed" || bad "${f}: missing or has TODOs"
done

SJ="${WORK}/settings.json"
if [[ ! -f "$SJ" ]]; then bad "settings.json not found"; else
  python3 -c "import json,sys; json.load(open('$SJ'))" 2>/dev/null && ok "settings.json is valid JSON" || bad "settings.json is invalid JSON"
  grep -q "mcpServers" "$SJ" && ok "settings.json has mcpServers" || bad "settings.json missing mcpServers"
  grep -q '"filesystem"\|"github"' "$SJ" && ok "Configured 2 MCP servers" || bad "Missing expected MCP server configs"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
