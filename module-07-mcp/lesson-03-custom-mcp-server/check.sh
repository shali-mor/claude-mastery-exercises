#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 03: Custom MCP Server checks ==="

TS="${WORK}/todo-server.ts"
if [[ ! -f "$TS" ]]; then bad "todo-server.ts not found"; else
  [[ $(grep -c "TODO" "$TS" 2>/dev/null || true) -eq 0 ]] && ok "todo-server.ts: no TODOs" || bad "todo-server.ts: has TODOs"
  grep -q "ListToolsRequestSchema\|CallToolRequestSchema" "$TS" && ok "Server implements MCP schemas" || bad "Missing MCP schema handlers"
  grep -q "get_todos\|create_todo" "$TS" && ok "Defines get_todos and create_todo tools" || bad "Missing tool definitions"
  grep -q "StdioServerTransport" "$TS" && ok "Uses StdioServerTransport" || bad "Missing StdioServerTransport"
fi

SJ="${WORK}/settings.json"
[[ -f "$SJ" ]] && grep -q "todo-manager\|mcpServers" "$SJ" && ok "settings.json registers server" || bad "settings.json not configured"

DP="${WORK}/demo-prompts.md"
[[ -f "$DP" && $(grep -c "TODO" "$DP" 2>/dev/null || true) -eq 0 ]] && ok "demo-prompts.md completed" || bad "demo-prompts.md missing or has TODOs"

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
