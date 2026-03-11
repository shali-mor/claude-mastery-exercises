// ─────────────────────────────────────────────────────────────────────────────
// n8n Code node: "Format Message"
// Mode: Run Once For Each Item
//
// Input:  Parsed Claude picks object
// Output: { message: string } — Telegram HTML ready to send
// ─────────────────────────────────────────────────────────────────────────────

const data = $input.first().json;

// If upstream parse failed, propagate the error message
if (data.parseError) {
  return [{ json: { message: data.message } }];
}

const medals = ['🥇', '🥈', '🥉'];

const lines = [
  `📈 <b>Swing Trade Picks — ${data.date}</b>\n`,
  `<i>${data.summary}</i>\n`,
];

data.picks.forEach((p, i) => {
  lines.push(
    `${medals[i] ?? `#${i + 1}`} <b>${p.ticker}</b> (score: ${p.score}/5)`,
    `💡 ${p.reason}`,
    `⚠️ Risk: ${p.risk}\n`,
  );
});

lines.push('<i>Not financial advice. Do your own research.</i>');

return [{ json: { message: lines.join('\n') } }];
