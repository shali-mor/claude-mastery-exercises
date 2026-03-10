# Acme SaaS — Claude Code Context

## Stack
- **Next.js 15** (App Router) — primary framework
- **TypeScript 5.x** — strict mode enabled
- **Tailwind CSS 4** — utility-first styling
- **Supabase** — PostgreSQL database + auth + storage
- **Drizzle ORM** — type-safe database queries
- **Vitest** — unit and integration tests

## Key Files
- `src/app/` — Next.js App Router pages and layouts
- `src/db/schema.ts` — Drizzle ORM table definitions (source of truth for DB shape)
- `src/lib/supabase.ts` — Supabase client initialization
- `.env.local` — local secrets (never commit; see `.env.example` for shape)
- `src/app/api/` — server-side API route handlers

## Coding Conventions
1. **Naming**: PascalCase for components/types, camelCase for functions/variables, kebab-case for files
2. **Imports**: stdlib → third-party → internal (`@/`) — always use path aliases
3. **Error handling**: use `Result<T, E>` pattern or typed throws — never swallow errors silently
4. **Components**: one component per file; keep under 200 lines; extract hooks to `src/hooks/`
5. **Types**: no `any` — use `unknown` + type guards; export shared types from `src/types/`
6. **Async**: prefer `async/await`; wrap Supabase calls in try/catch with typed error objects
7. **Env vars**: always access via `src/config/env.ts` — never `process.env.X` directly in components

## What NOT to Do
- ❌ Raw SQL strings — always use Drizzle ORM query builders
- ❌ `as any` or `// @ts-ignore` — fix the types properly
- ❌ Direct `process.env` access outside `src/config/env.ts`
- ❌ Mutating Zustand state outside store actions
- ❌ Committing `.env.local` or any file containing real secrets

## Running the Project
```bash
pnpm dev          # Start dev server at localhost:3000
pnpm test         # Run Vitest test suite
pnpm lint         # ESLint + TypeScript type-check
pnpm build        # Production build
pnpm db:push      # Push Drizzle schema changes to Supabase
```

## CI/CD Notes
- **Branch strategy**: `main` (production) ← `dev` (staging) ← `feature/*` (PRs)
- **PR rules**: 1 approver required; all checks must pass; squash merge only
- **Secrets**: stored in GitHub Actions secrets — never in code or PR descriptions
- **Deploys**: Vercel auto-deploys `main` to production, `dev` to staging preview
