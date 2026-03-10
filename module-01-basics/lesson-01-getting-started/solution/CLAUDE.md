# CLAUDE.md

## Project Overview
A minimal Node.js app that processes user orders, applies country-specific tax rates, and prints a formatted summary.

## Tech Stack
- Runtime: Node.js 18+
- Language: JavaScript (CommonJS)
- Dependencies: none (stdlib only)

## Key Files
- `app.js`: entry point — iterates users, calls utils, prints JSON results
- `utils.js`: exports `formatGreeting()` and `calculateTax()` helpers

## Conventions
1. Use `const` for all variables; avoid `var`
2. All functions must have JSDoc comments
3. Tax rates live in `TAX_RATES` in `utils.js` — do not hardcode them elsewhere

## Commands
- Run: `node app.js`
