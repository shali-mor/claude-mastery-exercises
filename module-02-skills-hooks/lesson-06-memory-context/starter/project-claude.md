# Project Context
# File: .claude/CLAUDE.md — committed to Git, shared with the whole team.

## Stack
- Framework: Next.js 14 (App Router)
- Language: TypeScript (strict mode)
- Styling: Tailwind CSS
- Database: PostgreSQL via Prisma

## Conventions
- Components in `src/components/` — one component per file
- API routes in `src/app/api/` — always validate with Zod
- Tests co-located: `Button.tsx` + `Button.test.tsx`

## Do NOT
- Use `any` type — use `unknown` and narrow
- Commit .env files
- Use `useEffect` for derived state — use `useMemo`

## Architecture decisions
# TODO: Add one real (or realistic) architecture decision here.
# Format:
# - [What you chose]: [brief description]
#   Rationale: [one sentence explaining why]
#   Do not: [what Claude should never do that contradicts this]
#
# Example:
# - Server-side rendering for all data fetching (no client-side fetch in components)
#   Rationale: Simplifies auth token handling and improves SEO.
#   Do not: add useEffect data fetching to page components.
