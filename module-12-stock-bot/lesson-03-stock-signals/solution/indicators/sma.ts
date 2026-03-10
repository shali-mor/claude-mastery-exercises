export function calculateSMA(closes: number[], period: number): number {
  if (closes.length < period) {
    throw new Error(`Need at least ${period} data points for SMA, got ${closes.length}`);
  }
  const slice = closes.slice(-period);
  return Math.round((slice.reduce((a, b) => a + b, 0) / period) * 100) / 100;
}
