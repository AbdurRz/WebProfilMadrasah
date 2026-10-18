<?php
    $user = auth()->user();
    $menu = [
        'Utama' => [['Dashboard', 'admin.dashboard', 'M3 12 12 3l9 9M5 10v10h14V10']],
        'Konten' => [
            ['Berita', 'admin.posts.index', 'M4 5h16v14H4zM8 9h8M8 13h8M8 17h5'],
            ['Kategori', 'admin.categories.index', 'M4 6h7v7H4zM13 6h7v7h-7zM4 15h7v5H4z'],
            ['Pengumuman', 'admin.announcements.index', 'M3 11v2l13 5V6L3 11ZM16 9a3 3 0 0 1 0 6'],
            ['Agenda', 'admin.events.index', 'M4 6h16v14H4zM8 3v5M16 3v5M4 11h16'],
            ['Galeri', 'admin.galleries.index', 'M4 5h16v14H4zM4 16l5-5 4 4 3-3 4 4'],
            ['Prestasi', 'admin.achievements.index', 'M8 21h8M12 17v4M7 4h10v5a5 5 0 0 1-10 0V4Z'],
            ['Unduhan', 'admin.documents.index', 'M12 4v11m0 0-4-4m4 4 4-4M5 20h14'],
        ],
        'Kesiswaan' => [
            ['Ekstrakurikuler', 'admin.extracurriculars.index', 'M12 3l2.5 5 5.5.8-4 3.9.9 5.5L12 15.6 7.1 18.2l.9-5.5-4-3.9 5.5-.8Z'],
            ['Pengurus OSIM', 'admin.osim.index', 'M17 20v-2a4 4 0 0 0-4-4H7a4 4 0 0 0-4 4v2M10 10a4 4 0 1 0 0-8 4 4 0 0 0 0 8ZM21 20v-2a4 4 0 0 0-3-3.9M16 2.1a4 4 0 0 1 0 7.8'],
        ],
    ];
    if ($user->isAdmin()) {
        $menu['PPDB'] = [['Pendaftar PPDB', 'admin.ppdb.index', 'M9 5H7a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-2M9 5a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2M9 5a2 2 0 0 1 2-2h2a2 2 0 0 1 2 2M9 14l2 2 4-4']];
        $newPpdb = \App\Models\PpdbRegistration::where('status', 'baru')->count();
        $menu['Madrasah'] = [
            ['Halaman Profil', 'admin.pages.index', 'M6 3h9l4 4v14H6zM9 12h7M9 16h7'],
            ['Guru & Tendik', 'admin.teachers.index', 'M12 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8ZM4 21a8 8 0 0 1 16 0'],
            ['Fasilitas', 'admin.facilities.index', 'M3 21h18M5 21V8l7-5 7 5v13M9 21v-6h6v6'],
            ['Statistik', 'admin.statistics.index', 'M4 20V10M10 20V4M16 20v-7M22 20H2'],
        ];
        $menu['Sistem'] = [
            ['Pengguna', 'admin.users.index', 'M16 11a4 4 0 1 0-8 0M3 21a9 9 0 0 1 18 0'],
            ['Pengaturan', 'admin.settings.edit', 'M12 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM19 12l2-1-2-4-2 1-2-2V4h-4v2L9 7 7 6l-2 4 2 1v2l-2 1 2 4 2-1 2 2v2h4v-2l2-2 2 1 2-4-2-1Z'],
            ['Log Aktivitas', 'admin.logs', 'M12 8v4l3 2M12 21a9 9 0 1 1 0-18 9 9 0 0 1 0 18Z'],
        ];
    }
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">
    <title><?php echo $__env->yieldContent('title', 'Dashboard'); ?> — CMS MTsN 1 Bukittinggi</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@500;700&family=Playfair+Display:wght@500;600&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/trix@2.1.8/dist/trix.css">
    <script src="https://unpkg.com/trix@2.1.8/dist/trix.umd.min.js" defer></script>
    <?php echo app('Illuminate\Foundation\Vite')(['resources/css/app.css', 'resources/js/app.js']); ?>
</head>
<body class="bg-sand" x-data="{ side: false }">
    <aside :class="side ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'" class="fixed inset-y-0 left-0 z-40 flex w-64 flex-col bg-forest text-white/75 transition-transform duration-300" data-testid="admin-sidebar">
        <div class="songket absolute inset-0 opacity-30"></div>
        <a href="<?php echo e(route('admin.dashboard')); ?>" class="relative flex h-16 items-center gap-3 border-b border-white/10 px-6">
            <span class="grid h-9 w-9 place-items-center rounded-lg bg-gold font-serif text-lg font-bold text-forest">M</span>
            <span class="leading-tight"><span class="block font-serif text-white">MTsN 1 CMS</span><span class="text-[11px] text-white/50">Bukittinggi</span></span>
        </a>
        <nav class="relative flex-1 space-y-6 overflow-y-auto px-3 py-6">
            <?php $__currentLoopData = $menu; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $group => $items): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div>
                    <p class="mb-2 px-3 text-[10px] font-semibold uppercase tracking-[0.2em] text-gold/80"><?php echo e($group); ?></p>
                    <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as [$label, $r, $icon]): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php $active = Str::endsWith($r, ['.index', '.edit']) ? request()->routeIs(Str::beforeLast($r, '.').'.*') : request()->routeIs($r); ?>
                        <a href="<?php echo e(route($r)); ?>" class="mb-0.5 flex items-center gap-3 rounded-lg px-3 py-2 text-sm transition-colors <?php echo e($active ? 'bg-white/10 text-white' : 'hover:bg-white/5 hover:text-white'); ?>" data-testid="sidebar-<?php echo e(Str::slug($label)); ?>-link">
                            <svg class="h-4 w-4 <?php echo e($active ? 'text-gold' : ''); ?>" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24"><path d="<?php echo e($icon); ?>"/></svg>
                            <?php echo e($label); ?>

                            <?php if($r === 'admin.ppdb.index' && ($newPpdb ?? 0) > 0): ?><span class="ml-auto rounded-full bg-gold px-2 py-0.5 font-mono text-[10px] font-bold text-forest" data-testid="sidebar-ppdb-badge"><?php echo e($newPpdb); ?></span><?php endif; ?>
                        </a>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </nav>
        <div class="relative border-t border-white/10 p-4">
            <a href="<?php echo e(route('home')); ?>" target="_blank" class="block rounded-lg px-3 py-2 text-xs hover:bg-white/5" data-testid="sidebar-view-site-link">Lihat website ↗</a>
        </div>
    </aside>
    <div x-cloak x-show="side" @click="side = false" class="fixed inset-0 z-30 bg-forest/40 lg:hidden"></div>

    <div class="lg:pl-64">
        <header class="sticky top-0 z-20 flex h-16 items-center justify-between border-b border-stone-line bg-white/85 px-5 backdrop-blur-xl sm:px-8">
            <div class="flex items-center gap-3">
                <button @click="side = true" class="grid h-9 w-9 place-items-center rounded-lg border border-stone-line lg:hidden" data-testid="admin-sidebar-toggle">☰</button>
                <p class="font-serif text-lg text-forest" data-testid="admin-page-title"><?php echo $__env->yieldContent('title', 'Dashboard'); ?></p>
            </div>
            <div class="flex items-center gap-4" x-data="{ menu: false }">
                <div class="relative">
                    <button @click="menu = !menu" class="flex items-center gap-3" data-testid="admin-user-menu">
                        <span class="hidden text-right text-sm sm:block"><span class="block font-medium text-ink"><?php echo e($user->name); ?></span><span class="text-xs capitalize text-ink/50"><?php echo e($user->role); ?></span></span>
                        <span class="grid h-9 w-9 place-items-center rounded-full bg-emerald-brand text-sm font-semibold text-white"><?php echo e(Str::substr($user->name, 0, 1)); ?></span>
                    </button>
                    <div x-cloak x-show="menu" @click.outside="menu = false" x-transition class="card absolute right-0 mt-2 w-48 p-1.5 shadow-xl">
                        <form method="post" action="<?php echo e(route('admin.logout')); ?>"><?php echo csrf_field(); ?>
                            <button class="w-full rounded-lg px-3 py-2 text-left text-sm text-red-700 hover:bg-red-50" data-testid="admin-logout-button">Keluar</button>
                        </form>
                    </div>
                </div>
            </div>
        </header>

        <main class="p-5 sm:p-8">
            <?php if(session('success')): ?>
                <div x-data="{ show: true }" x-init="setTimeout(() => show = false, 4000)" x-show="show" x-transition class="mb-6 flex items-center gap-3 rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-800" data-testid="flash-success">✓ <?php echo e(session('success')); ?></div>
            <?php endif; ?>
            <?php if(session('whatsapp')): ?>
                <?php $wa = session('whatsapp'); ?>
                <div class="mb-6 overflow-hidden rounded-2xl border border-emerald-200 bg-white" x-data="{ copied: false }" data-testid="whatsapp-share-panel">
                    <div class="flex flex-wrap items-center justify-between gap-4 bg-emerald-brand px-5 py-4 text-white">
                        <div>
                            <p class="text-[11px] font-semibold uppercase tracking-[0.2em] text-gold">Pengumuman mendesak</p>
                            <p class="mt-1 font-medium">Pesan WhatsApp siap dibagikan ke grup orang tua</p>
                        </div>
                        <div class="flex flex-wrap gap-2">
                            <a href="<?php echo e($wa['url']); ?>" target="_blank" rel="noopener" class="btn-gold" data-testid="whatsapp-share-button">Kirim via WhatsApp</a>
                            <button type="button" @click="navigator.clipboard.writeText($refs.waText.value); copied = true; setTimeout(() => copied = false, 2000)" class="btn border border-white/30 text-white hover:bg-white hover:text-forest" data-testid="whatsapp-copy-button"><span x-text="copied ? 'Tersalin ✓' : 'Salin teks'"></span></button>
                        </div>
                    </div>
                    <textarea x-ref="waText" readonly rows="8" class="w-full resize-none border-0 bg-sand/60 px-5 py-4 font-mono text-xs leading-6 text-ink/80 outline-none" data-testid="whatsapp-message-preview"><?php echo e($wa['text']); ?></textarea>
                </div>
            <?php endif; ?>
            <?php if($errors->any()): ?>
                <div class="mb-6 rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700" data-testid="flash-errors">
                    <p class="font-medium">Periksa kembali isian Anda:</p>
                    <ul class="mt-1 list-inside list-disc"><?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $e): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><li><?php echo e($e); ?></li><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?></ul>
                </div>
            <?php endif; ?>
            <?php echo $__env->yieldContent('content'); ?>
        </main>
    </div>
    <?php echo $__env->yieldPushContent('scripts'); ?>
</body>
</html>
<?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/layouts/admin.blade.php ENDPATH**/ ?>