# Exam Revision Budget

**Split your study hours like money**

Split your study hours like money.

A full-stack demo built with **Next.js 14 (App Router)**, **Tailwind CSS** and a
**Supabase (Postgres)** backend. Records are written from the browser straight to
Postgres through row-level security policies — no custom API layer to maintain.

---

## Stack

| Layer | Choice |
| --- | --- |
| Framework | Next.js 14, App Router, TypeScript |
| Styling | Tailwind CSS |
| Database | Supabase Postgres, RLS-secured |
| Hosting | GitHub Pages (static export via Actions) |

## Run it locally

```bash
npm install
cp .env.example .env.local   # add your Supabase URL + anon key
npm run dev
```

Open http://localhost:3000.

## Set up the database

Run `supabase/migrations/0001_init.sql` in the Supabase SQL editor. It is
idempotent — safe to run more than once. It creates the `exam_revision_budget_sessions` table,
enables row-level security, and adds read/insert policies for anonymous users.

## Data model

Table: `exam_revision_budget_sessions`

| Column | Type |
| --- | --- |
| `subject` | text |
| `minutes` | integer |
| `topic` | text |
| `confidence` | integer |
| `studied_on` | date |
| `created_at` | timestamptz |

Every row also has `id uuid` and `created_at timestamptz`.

## Deploy

Pushing to `main` runs `.github/workflows/deploy-pages.yml`, which builds a static
export and publishes it to GitHub Pages. Set `NEXT_PUBLIC_SUPABASE_URL` and
`NEXT_PUBLIC_SUPABASE_ANON_KEY` as repository Actions secrets first.

Live: https://password123-blip.github.io/exam-revision-budget/

## What it does

- **Hours per subject** — See where the time actually went, not where you think it went.
- **Confidence tracking** — Rate each topic so weak areas surface on their own.
- **Built for competitive exams** — UPSC, SSC, GATE — same shape of problem.

## License

MIT
