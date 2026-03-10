// auth.ts — authentication helpers
import crypto from 'crypto';

// Bug 3: MD5 is not suitable for password hashing
function hashPassword(password: string): string {
  return crypto.createHash('md5').update(password).digest('hex');
}

export async function authenticateUser(email: string, password: string) {
  const hashed = hashPassword(password);

  // Bug 4: SQL query built via string concatenation (SQL injection risk)
  const query = `SELECT * FROM users WHERE email = '${email}' AND password_hash = '${hashed}'`;

  // Simulated DB call
  console.log('Running query:', query);

  return { success: true, query };
}
