interface ValidationResult {
  valid: boolean;
  data?: Record<string, unknown>;
  error?: string;
}

interface EmailClassification {
  category: string;
  priority: 'high' | 'medium' | 'low';
  summary: string;
}

// TODO: Implement validateEmailClassification
// 1. Extract JSON from Claude's response (it may be wrapped in markdown code blocks)
// 2. JSON.parse the extracted string
// 3. Validate: category is a non-empty string, priority is one of high/medium/low, summary is a string
// 4. Return { valid: true, data } or { valid: false, error: "..." }
function validateEmailClassification(responseText: string): ValidationResult {
  // TODO: implement
  return { valid: false, error: 'Not implemented' };
}

// Test it
const testCases = [
  '{"category":"billing","priority":"high","summary":"User was double charged"}',
  '```json\n{"category":"bug","priority":"medium","summary":"Login fails on mobile"}\n```',
  'I cannot classify this email',
  '{"category":"bug"}', // missing fields
];

for (const tc of testCases) {
  const result = validateEmailClassification(tc);
  console.log(result.valid ? `✅ Valid: ${JSON.stringify(result.data)}` : `❌ Invalid: ${result.error}`);
}
