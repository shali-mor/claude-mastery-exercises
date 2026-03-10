// utils.js — shared utility functions

const TAX_RATES = {
  US: 0.08,
  UK: 0.20,
  CA: 0.13,
};

/**
 * Returns a personalised greeting string.
 * @param {string} name
 * @returns {string}
 */
function formatGreeting(name) {
  return `Hello, ${name}! Welcome to the store.`;
}

/**
 * Calculates tax for a purchase amount based on country code.
 * @param {number} amount
 * @param {string} countryCode
 * @returns {number}
 */
function calculateTax(amount, countryCode) {
  const rate = TAX_RATES[countryCode] ?? 0;
  return parseFloat((amount * rate).toFixed(2));
}

module.exports = { formatGreeting, calculateTax };
