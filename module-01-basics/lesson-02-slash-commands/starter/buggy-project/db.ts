// db.ts — database access layer

// Bug 5: hardcoded credentials in source code
const DB_CONFIG = {
  host: 'prod-db.internal',
  user: 'admin',
  password: 'super_secret_password_123',
  database: 'users_db',
};

export async function getUser(id: string) {
  // Simulated lookup — in a real app this would query the DB
  console.log('Connecting with config:', DB_CONFIG);
  return {
    id,
    name: 'Test User',
    email: 'test@example.com',
  };
}
