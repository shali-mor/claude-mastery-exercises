// TODO: Implement calculateRSI(closes: number[], period = 14): number
//
// Algorithm:
// 1. Compute daily changes: closes[i] - closes[i-1]
// 2. Separate into gains (positive) and losses (absolute value of negative)
// 3. Average gain and average loss over the first `period` days
// 4. RS = avgGain / avgLoss
// 5. RSI = 100 - (100 / (1 + RS))
// 6. Return RSI rounded to 1 decimal place
//
// Edge cases:
// - If avgLoss === 0, RSI = 100
// - If closes.length < period + 1, throw an error

export function calculateRSI(closes: number[], period = 14): number {
  // TODO: implement
  throw new Error('Not implemented');
}
