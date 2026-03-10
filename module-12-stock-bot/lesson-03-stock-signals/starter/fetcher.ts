export interface OHLCVData {
  ticker: string;
  closes: number[];
  currentPrice: number;
  changePercent: number;
}

// Yahoo Finance free API (no key needed, ~100 req/min limit)
const YAHOO_URL = 'https://query1.finance.yahoo.com/v8/finance/chart';

// TODO: Implement fetchStockData(ticker: string): Promise<OHLCVData>
// 1. Fetch from `${YAHOO_URL}/${ticker}?interval=1d&range=3mo`
// 2. Extract closes from result.chart.result[0].indicators.quote[0].close
// 3. Get current price from the last close
// 4. Calculate % change: (last - secondLast) / secondLast * 100
// 5. Return OHLCVData object
// 6. Throw a descriptive error if ticker is invalid or data is missing
export async function fetchStockData(ticker: string): Promise<OHLCVData> {
  // TODO: implement
  throw new Error('Not implemented');
}
