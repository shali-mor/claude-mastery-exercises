// ─────────────────────────────────────────────────────────────────────────────
// n8n Code node: "Parse Response"
// Mode: Run Once For Each Item
//
// Input:  Claude API HTTP response
// Output: Parsed picks object ready for formatting
// ─────────────────────────────────────────────────────────────────────────────

const raw = $input.first().json.content?.[0]?.text ?? '';

let data;
try {
  // Claude occasionally wraps JSON in markdown fences — strip them
  const cleaned = raw
    .replace(/^```json\s*/i, '')
    .replace(/\s*```$/, '')
    .trim();
  data = JSON.parse(cleaned);
} catch (e) {
  return [{
    json: {
      parseError: true,
      message:    '❌ Could not parse Claude\'s response. Check n8n → Executions.',
      rawResponse: raw.slice(0, 500), // truncate to avoid huge logs
    },
  }];
}

// Validate expected shape
if (!data.picks || !Array.isArray(data.picks) || data.picks.length === 0) {
  return [{
    json: {
      parseError: true,
      message: '❌ Claude returned unexpected JSON structure.',
      rawResponse: raw.slice(0, 500),
    },
  }];
}

return [{ json: data }];
