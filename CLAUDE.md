@RTK.md
@STANDARDS.md

## Docs
Always use context7 MCP to verify API usage before writing code for any library or framework.

## Default Stack
Unless project context says otherwise, assume:
- Frontend: Next.js (App Router, TypeScript, Tailwind)
- Backend: Next.js API routes / Server Actions
- Database: Supabase (Postgres + Auth + Storage)
- Deploy: Vercel

## Rails Stack (when in a Rails project)
- Frontend: JavaScript (ES modules, Stimulus, Hotwire Turbo)
- Backend: Ruby on Rails (MVC, ActiveRecord, Turbo Streams)
- Tests: RSpec (backend), Jest (frontend)

## Rails Conventions
- Always generate migrations — never edit schema.rb directly
- Fat models, thin controllers; service objects for complex business logic
- `bundle exec rspec` to run tests

## JS Conventions
- ES modules only, no CommonJS
- Native fetch for HTTP; no lib unless complex
- Stimulus for Rails-integrated JS

## ECC Workflow Commands
- `/database-migration` — schema change flow (generate migration first)
- `/feature-development` — standard feature flow
- `node tests/run-all.js` — run ECC tests

## MCP Servers
- `context7` — live Rails/JS docs (use for API lookups)
- `playwright` — E2E testing Turbo/Stimulus UI
- `sequential-thinking` — complex migration/architecture planning
- `github` — PR and issue context
