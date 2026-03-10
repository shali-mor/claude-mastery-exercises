// routes.ts — API route definitions
import { Express, Request, Response } from 'express';

export function registerRoutes(app: Express) {
  // Health check
  app.get('/health', (_req: Request, res: Response) => {
    res.json({ status: 'ok', timestamp: new Date().toISOString() });
  });

  // Get user by ID
  app.get('/users/:id', (req: Request, res: Response) => {
    const { id } = req.params;
    // TODO: validate that id is a valid UUID before querying DB
    // TODO: add authentication check — only admins or the user themselves can fetch
    res.json({ id, name: 'Mock User', email: 'mock@example.com' });
  });

  // Create user
  app.post('/users', (req: Request, res: Response) => {
    const { name, email, password } = req.body;
    // TODO: hash password before storing
    // TODO: validate email format
    // TODO: check for duplicate email before inserting
    console.log('Creating user:', { name, email, password }); // Bug: logs password
    res.status(201).json({ id: 'new-id', name, email });
  });

  // Delete user
  app.delete('/users/:id', (req: Request, res: Response) => {
    // TODO: add authorization — only admins should be able to delete
    res.json({ deleted: req.params.id });
  });
}
