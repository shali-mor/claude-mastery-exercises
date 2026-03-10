import { analyzeStock } from './index';

async function main() {
  console.log('Testing stock bot analysis for AAPL...\n');

  // TODO: Call analyzeStock('AAPL')
  // Print the result
  // Verify it contains at least: price info, RSI, and a recommendation (BUY/HOLD/SELL)

  const result = await analyzeStock('AAPL');
  console.log(result);

  // Validation
  const hasPriceInfo = /\$[\d.]+/.test(result);
  const hasRSI = /RSI/i.test(result);
  const hasRecommendation = /buy|hold|sell/i.test(result);

  console.log('\n--- Validation ---');
  console.log(hasPriceInfo ? '✅ Has price info' : '❌ Missing price info');
  console.log(hasRSI ? '✅ Has RSI' : '❌ Missing RSI');
  console.log(hasRecommendation ? '✅ Has recommendation' : '❌ Missing BUY/HOLD/SELL');
}

main().catch(console.error);
