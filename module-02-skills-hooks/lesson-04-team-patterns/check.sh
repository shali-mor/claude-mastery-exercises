#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 04: Team Patterns checks ==="

# --- CLAUDE.md checks ---
CM="${WORK}/CLAUDE.md"
if [[ ! -f "$CM" ]]; then bad "CLAUDE.md not found in starter/"; else
  [[ $(grep -c "TODO" "$CM" 2>/dev/null) -eq 0 ]] && ok "No remaining TODOs in CLAUDE.md" || bad "CLAUDE.md still has TODO markers"
  grep -qi "stack\|technologies" "$CM" && ok "CLAUDE.md has Stack section" || bad "CLAUDE.md missing Stack section"
  grep -qi "key files\|entry point" "$CM" && ok "CLAUDE.md has Key Files section" || bad "CLAUDE.md missing Key Files section"
  grep -qi "convention\|naming\|rule" "$CM" && ok "CLAUDE.md has Conventions section" || bad "CLAUDE.md missing Conventions section"
  grep -qi "not do\|forbidden\|avoid\|never" "$CM" && ok "CLAUDE.md has 'What NOT to Do' section" || bad "CLAUDE.md missing 'What NOT to Do' section"
  grep -qi "dev\|npm run\|pnpm\|yarn" "$CM" && ok "CLAUDE.md has Running commands" || bad "CLAUDE.md missing run commands"
fi

# --- settings.json checks ---
SJ="${WORK}/settings.json"
if [[ ! -f "$SJ" ]]; then bad "settings.json not found in starter/"; else
  python3 -c "import json,sys; json.load(open('$SJ'))" 2>/dev/null && ok "settings.json is valid JSON" || bad "settings.json is not valid JSON"
  grep -q "acceptEdits" "$SJ" && ok "defaultMode set to acceptEdits" || bad "defaultMode not set to acceptEdits"
  grep -q '"bash"' "$SJ" && ok "bash tool is allowed" || bad "bash tool not in allowedTools"
fi

# --- skill check ---
SK="${WORK}/commands/pr-checklist.md"
if [[ ! -f "$SK" ]]; then bad "commands/pr-checklist.md not found in starter/"; else
  [[ $(grep -c "TODO" "$SK" 2>/dev/null) -eq 0 ]] && ok "No TODOs in pr-checklist.md" || bad "pr-checklist.md still has TODOs"
  grep -qi "git diff\|staged\|pull request\|PR" "$SK" && ok "Skill references git diff or PR" || bad "Skill doesn't mention git diff or PR"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
