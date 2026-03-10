interface Finding {
  severity: 'HIGH' | 'MEDIUM' | 'LOW';
  file: string;
  line: number;
  message: string;
  suggestion: string;
}

interface AgentResult {
  agent_id: string;
  status: 'success' | 'error';
  findings: Finding[];
  summary: string;
  error: string | null;
}

// TODO: Parse a sub-agent response text and extract the JSON block
// The agent wraps its JSON in ```json ... ``` code blocks
function parseAgentResponse(responseText: string): AgentResult | null {
  // TODO: Use regex to extract content between ```json and ```
  // Then JSON.parse it
  // Return null if parsing fails
  return null; // TODO
}

// TODO: Validate that a parsed result has all required fields
function validateResult(result: unknown): result is AgentResult {
  // TODO: Check that result has agent_id, status, findings (array), summary
  return false; // TODO
}

// TODO: Aggregate multiple agent results into a final report
function aggregateResults(results: AgentResult[]): string {
  // TODO: Combine all findings, sorted by severity (HIGH first)
  // Add a summary section listing each agent's summary
  // Return formatted Markdown
  return 'TODO';
}

// Example usage
async function main() {
  const mockResponses = [
    '```json\n{"agent_id":"security","status":"success","findings":[{"severity":"HIGH","file":"auth.ts","line":42,"message":"SQL injection","suggestion":"Use parameterized queries"}],"summary":"Found 1 critical issue","error":null}\n```',
    '```json\n{"agent_id":"quality","status":"success","findings":[],"summary":"No quality issues found","error":null}\n```',
    'Some malformed response without JSON', // error case
  ];

  const results: AgentResult[] = [];
  for (const response of mockResponses) {
    const parsed = parseAgentResponse(response);
    if (parsed && validateResult(parsed)) {
      results.push(parsed);
    } else {
      console.error('Failed to parse agent response:', response.slice(0, 50));
    }
  }

  console.log(aggregateResults(results));
}

main().catch(console.error);
