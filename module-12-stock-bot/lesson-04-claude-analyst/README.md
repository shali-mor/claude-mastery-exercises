# Lesson 04: Claude as the Analyst

Complete the stock bot by wiring Claude's analysis into the pipeline.

## What you'll build
- A Claude analyser that interprets technical signals
- The complete bot with all components wired together
- A test script that runs a sample analysis

## Key concepts
- Claude receives: ticker, price, % change, RSI, MACD, SMA signals
- Claude outputs: plain English buy/hold/sell recommendation with reasoning
- Use Haiku for cost-effective analysis (~50 tokens output)
- Cache the system prompt: "You are an expert technical analyst..." saves 90% on repeated calls
- Add a `⚠️ Not financial advice` disclaimer to every response

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
