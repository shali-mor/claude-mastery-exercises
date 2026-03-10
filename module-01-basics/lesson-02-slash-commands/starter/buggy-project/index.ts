// index.ts — application entry point
import { authenticateUser } from './auth';
import { getUser } from './db';

async function main() {
  // TODO (exercise): Claude will review this file — intentional issues below

  const userId = process.argv[2];

  // Bug 1: no validation on userId before using it
  const user = await getUser(userId);

  // Bug 2: password passed in plaintext to log
  const result = await authenticateUser(user.email, process.argv[3]);
  console.log('Auth result:', result, 'password was:', process.argv[3]);

  if (result.success) {
    console.log('Welcome, ' + user.name);
  }
}

main();
