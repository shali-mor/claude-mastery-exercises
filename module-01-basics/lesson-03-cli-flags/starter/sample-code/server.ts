// server.ts — Express server setup
import express from 'express';
import { registerRoutes } from './routes';

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Register all API routes
registerRoutes(app);

// TODO: Add rate limiting middleware
// TODO: Add request logging middleware
// TODO: Add error handling middleware

export function startServer() {
  return app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
}

export { app };
