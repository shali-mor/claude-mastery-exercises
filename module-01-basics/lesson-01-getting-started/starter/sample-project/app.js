// app.js — entry point for the sample project
const { formatGreeting, calculateTax } = require('./utils');

const users = [
  { name: 'Alice', country: 'US', purchase: 100 },
  { name: 'Bob', country: 'UK', purchase: 250 },
  { name: 'Carol', country: 'CA', purchase: 75 },
];

function processOrders(users) {
  return users.map(user => {
    const tax = calculateTax(user.purchase, user.country);
    const greeting = formatGreeting(user.name);
    return {
      greeting,
      total: user.purchase + tax,
      tax,
    };
  });
}

const results = processOrders(users);
console.log(JSON.stringify(results, null, 2));
