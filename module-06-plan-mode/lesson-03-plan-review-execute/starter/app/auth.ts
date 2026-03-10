import jwt from 'jsonwebtoken';

const SECRET = process.env.JWT_SECRET ?? 'dev-secret';

// Token validation logic — will be extracted to token-validator.ts
export function validateToken(token: string): { userId: string } | null {
  try {
    const decoded = jwt.verify(token, SECRET) as { userId: string; exp: number };
    if (decoded.exp < Date.now() / 1000) return null;
    return { userId: decoded.userId };
  } catch {
    return null;
  }
}

export function generateToken(userId: string): string {
  return jwt.sign({ userId }, SECRET, { expiresIn: '24h' });
}

export function requireAuth(req: { headers: { authorization?: string } }) {
  const auth = req.headers.authorization;
  if (!auth?.startsWith('Bearer ')) return null;
  return validateToken(auth.slice(7));
}
