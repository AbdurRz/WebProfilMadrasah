<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">
    <title>Masuk — CMS MTsN 1 Bukittinggi</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;600&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <?php echo app('Illuminate\Foundation\Vite')(['resources/css/app.css', 'resources/js/app.js']); ?>
</head>
<body class="grid min-h-screen lg:grid-cols-2">
    <div class="relative hidden overflow-hidden bg-forest text-white grain lg:block">
        <img src="https://images.unsplash.com/photo-1689669060288-400996a38dcd?w=1400&q=70" alt="" class="absolute inset-0 h-full w-full object-cover opacity-30">
        <div class="songket absolute inset-0"></div>
        <div class="relative flex h-full flex-col justify-between p-14">
            <a href="<?php echo e(route('home')); ?>" class="text-sm text-white/70 hover:text-gold">← Kembali ke website</a>
            <div>
                <p class="text-[11px] font-semibold uppercase tracking-[0.25em] text-gold">Sistem Manajemen Konten</p>
                <h1 class="mt-4 max-w-md text-5xl leading-tight">Kelola informasi madrasah dengan mudah.</h1>
                <p class="mt-4 max-w-md text-white/65">Berita, pengumuman, agenda, statistik, dan galeri — dalam satu dashboard.</p>
            </div>
            <p class="text-xs text-white/40">MTsN 1 Bukittinggi · Kementerian Agama RI</p>
        </div>
    </div>
    <div class="flex items-center justify-center bg-sand p-6">
        <form method="post" action="<?php echo e(route('admin.login.attempt')); ?>" class="rise w-full max-w-sm" data-testid="login-form">
            <?php echo csrf_field(); ?>
            <span class="mb-8 grid h-12 w-12 place-items-center rounded-xl bg-emerald-brand font-serif text-xl font-bold text-gold">M</span>
            <h2 class="text-3xl text-forest">Masuk ke dashboard</h2>
            <p class="mt-2 text-sm text-ink/60">Gunakan akun yang diberikan administrator.</p>

            <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?><div class="mt-6 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700" data-testid="login-error"><?php echo e($message); ?></div><?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>

            <div class="mt-8 space-y-5">
                <div>
                    <label for="email" class="field-label">Email</label>
                    <input id="email" name="email" type="email" value="<?php echo e(old('email')); ?>" required autofocus autocomplete="username" class="field-input" data-testid="login-email-input">
                </div>
                <div x-data="{ show: false }">
                    <label for="password" class="field-label">Kata sandi</label>
                    <div class="relative">
                        <input id="password" name="password" :type="show ? 'text' : 'password'" required autocomplete="current-password" class="field-input pr-16" data-testid="login-password-input">
                        <button type="button" @click="show = !show" class="absolute right-3 top-1/2 -translate-y-1/2 text-xs text-ink/50" x-text="show ? 'Sembunyi' : 'Lihat'" data-testid="login-toggle-password"></button>
                    </div>
                </div>
                <label class="flex items-center gap-2 text-sm text-ink/70"><input type="checkbox" name="remember" class="accent-emerald-brand" data-testid="login-remember-checkbox"> Ingat saya</label>
                <button class="btn-primary w-full py-3" data-testid="login-submit-button">Masuk</button>
            </div>
        </form>
    </div>
</body>
</html>
<?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/admin/auth/login.blade.php ENDPATH**/ ?>