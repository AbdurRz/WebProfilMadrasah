# Website & CMS MTsN 1 Bukittinggi (Laravel 12 + MySQL)

## Instalasi di komputer / hosting
1. Syarat: PHP 8.2+, Composer, MySQL/MariaDB, Node.js + Yarn.
2. `composer install`
3. `cp .env.example .env` lalu isi `DB_*`, `APP_URL`, `ADMIN_EMAIL/ADMIN_PASSWORD`, `EDITOR_EMAIL/EDITOR_PASSWORD`.
4. `php artisan key:generate`
5. Database — pilih salah satu:
   - Impor data contoh: `mysql -u USER -p NAMA_DB < database/sql/mtsn1_bukittinggi.sql`
   - Atau buat baru: `php artisan migrate --seed`
6. `php artisan storage:link`
7. `yarn install && yarn build`
8. `php artisan serve` → buka http://localhost:8000 · Admin: `/admin/login`

Akun bawaan (dari dump SQL): admin@mtsn1bukittinggi.sch.id / Admin@MTsN1 — **segera ganti kata sandi setelah login**.
