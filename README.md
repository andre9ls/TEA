# TEA

TEA is a personal office time tracker for ingress/egress logging, daily balances, weekly/monthly totals, CSV export, and optional cloud sync.

## Cloud sync setup

1. Create a Supabase project.
2. Open the Supabase SQL editor and run `supabase-schema.sql`.
3. In Supabase Auth URL Configuration, set **Site URL** to:
   `https://andre9ls.github.io/TEA/`
4. In the same Supabase Auth URL Configuration screen, add this **Redirect URL**:
   `https://andre9ls.github.io/TEA/`
5. Open TEA, paste your Supabase project URL and anon key in the Cloud sync panel, then save.
6. Enter your email, request a magic link, and sign in from the same browser.

The anon key is safe to use in this public static app when row level security stays enabled. Each signed-in user can only read and write their own rows.
