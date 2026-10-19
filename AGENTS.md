# AGENTS.md

Laravel 12 CMS + public website for MTsN 1 Bukittinggi (Indonesian school site). Blade + Alpine.js + Tailwind v4 + Chart.js — no SPA, no API layer. All UI text, validation messages, and seed content are in Indonesian (`APP_LOCALE=id`, `lang/id/`).

## Commands

- Setup: see `INSTALL.md` (in Indonesian). After `composer install` + `.env`: either import `database/sql/mtsn1_bukittinggi.sql` **or** run `php artisan migrate --seed` — not both.
- Dev server (all-in-one): `composer dev` — runs `artisan serve` + queue listener + pail logs + Vite concurrently.
- Frontend: **use yarn, not npm** — `yarn.lock` is committed and `package.json` has no `package-lock.json` (note: the `composer dev` script calls `npm run dev`, which is fine once `node_modules` exists).
- Tests: `composer test` (= `config:clear` then `artisan test`). Tests use in-memory SQLite per `phpunit.xml`, independent of the MySQL `.env` config.
- Lint: `vendor/bin/pint` (default preset, no `pint.json`). **Do not run it repo-wide** — ~19 existing files fail current Pint defaults and a full run creates large unrelated diffs. Run it only on files you changed, and otherwise match surrounding style.
- No CI, no typecheck step.

## Test-suite gotcha

The suite is only the Laravel skeleton examples, and `tests/Feature/ExampleTest.php` **fails as-is** (it hits `/` without `RefreshDatabase`, so the SQLite DB has no tables). Any feature test touching the DB must `use RefreshDatabase;`. Do not treat a red suite as caused by your change without checking.

## Architecture

- `routes/web.php` holds everything: public site (`HomeController`, `PublicController`, `StudentAffairsController`, `PpdbController`) and the `/admin` CMS. No API routes.
- Admin auth is **custom** (no Breeze/Jetstream): `Admin\AuthController` + `role` middleware alias → `App\Http\Middleware\EnsureRole` (registered in `bootstrap/app.php`). Two roles: `admin` (everything) and `editor` (content resources only; settings, users, statistics, PPDB admin are `role:admin`).
- All admin CRUD goes through the abstract `Admin\CrudController`. A subclass only declares `$model`, `$route`, `$title`, `$singular`, `fields()`, `columns()`; it inherits index/create/edit/store/destroy, search, validation, uploads, and activity logging, and shares the generic views `resources/views/admin/crud/{index,form}.blade.php`. To add an admin module, subclass `CrudController` + add a `Route::resource` — do not write per-module controllers.
- `App\Support\Media` handles all uploads (public disk, `uploads/{route}/`) and richtext sanitizing. `Media::url()` accepts both stored paths and full external URLs and falls back to a placeholder — seed data uses external Unsplash/Pexels URLs, so image columns are often absolute URLs, not local paths.
- Uploaded media at `/storage/{path}` is served by the `storage.serve` route in `routes/web.php` (from the `public` disk), so it works even when the `public/storage` symlink is missing — `storage:link` silently fails on Windows (no admin/Developer Mode). Do **not** set `'serve' => true` on the `local` disk in `config/filesystems.php`: it registers a conflicting `/storage/{path}` route that shadows the public uploads route. Private PPDB documents are served separately in `Admin\PpdbController::document()`.
- Models with slugs use the `HasSlug` trait (`getRouteKeyName()` = `slug`, auto-regenerates when the source field changes). Route-model binding matches on slug, not id.
- `Setting` is a key/value store cached forever under the `settings` cache key, invalidated on save. Read via `Setting::get('key')`; `ppdb_open`/`ppdb_year`/`ppdb_quota` control the public PPDB (admission) flow.

## Seeding / data

- `DatabaseSeeder` reads `ADMIN_EMAIL`/`ADMIN_PASSWORD`/`EDITOR_EMAIL`/`EDITOR_PASSWORD` from `.env` (password is hashed via the User model cast). It skips content seeding if `Post::exists()`; `ModuleSeeder` skips if `Extracurricular::exists()` — so re-seeding is idempotent, but changes to seed data won't apply to an already-seeded DB.
- Default admin from the SQL dump: `admin@mtsn1bukittinggi.sch.id` / `Admin@MTsN1`.

## Git

- `storage/framework/views/` compiled Blade caches are untracked but **not gitignored** — they show up in `git status`; never commit them.
