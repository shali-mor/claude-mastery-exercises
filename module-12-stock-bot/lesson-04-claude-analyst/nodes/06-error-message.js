// ─────────────────────────────────────────────────────────────────────────────
// n8n Code node: "Error Message"
// Mode: Run Once For Each Item
// Placement: Connected to the ERROR output of the Claude API HTTP node
//
// Purpose: Build an alert message when the Claude API call fails.
//          Wire this node's output → Telegram "Send Error" node.
// ─────────────────────────────────────────────────────────────────────────────

const errData = $input.first().json;

// n8n puts the error details in different places depending on version
const errMsg =
  errData.error?.message ??
  errData.message ??
  JSON.stringify(errData).slice(0, 200);

const message =
  `❌ <b>Stock Bot Error</b>\n\n` +
  `The daily picks run failed at the Claude API step.\n\n` +
  `<code>${errMsg}</code>\n\n` +
  `Check <b>n8n → Executions</b> for the full trace.`;

return [{ json: { message } }];
