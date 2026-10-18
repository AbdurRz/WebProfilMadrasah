<?php $__env->startSection('title', 'Dashboard'); ?>

<?php $__env->startSection('content'); ?>
    <div class="mb-8 flex flex-wrap items-end justify-between gap-4">
        <div>
            <p class="text-sm text-ink/55"><?php echo e(now()->translatedFormat('l, d F Y')); ?></p>
            <h1 class="mt-1 text-3xl text-forest" data-testid="dashboard-greeting">Assalamu'alaikum, <?php echo e(Str::before(auth()->user()->name, ' ')); ?>.</h1>
        </div>
        <div class="flex flex-wrap gap-2">
            <a href="<?php echo e(route('admin.posts.create')); ?>" class="btn-primary" data-testid="quick-add-post">+ Berita</a>
            <a href="<?php echo e(route('admin.announcements.create')); ?>" class="btn-ghost" data-testid="quick-add-announcement">+ Pengumuman</a>
            <a href="<?php echo e(route('admin.events.create')); ?>" class="btn-ghost" data-testid="quick-add-event">+ Agenda</a>
        </div>
    </div>

    <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <?php $__currentLoopData = $counts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $label => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="card p-5 <?php echo e($loop->first ? 'bg-forest text-white border-forest' : ''); ?>">
                <p class="text-xs <?php echo e($loop->first ? 'text-white/60' : 'text-ink/55'); ?>"><?php echo e($label); ?></p>
                <p class="mt-2 font-mono text-3xl font-bold <?php echo e($loop->first ? 'text-gold' : 'text-forest'); ?>" data-testid="dashboard-count-<?php echo e(Str::slug($label)); ?>"><?php echo e($value); ?></p>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>

    <div class="mt-6 grid gap-6 xl:grid-cols-3">
        <div class="card p-6 xl:col-span-2">
            <div class="flex items-center justify-between">
                <p class="font-medium text-forest">Berita terbit per bulan</p>
                <p class="text-xs text-ink/50">Total dibaca: <span class="font-mono text-ink"><?php echo e(number_format($totalViews, 0, ',', '.')); ?></span></p>
            </div>
            <div class="mt-4 h-64"><canvas id="postsChart" data-testid="dashboard-posts-chart"></canvas></div>
        </div>
        <div class="card p-6">
            <p class="font-medium text-forest">Agenda mendatang</p>
            <ul class="mt-4 space-y-4">
                <?php $__empty_1 = true; $__currentLoopData = $upcoming; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $e): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <li class="flex gap-3"><span class="w-14 shrink-0 font-mono text-xs text-emerald-brand"><?php echo e($e->starts_at->translatedFormat('d M')); ?></span><span class="text-sm"><?php echo e($e->title); ?></span></li>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <li class="text-sm text-ink/50">Tidak ada agenda.</li>
                <?php endif; ?>
            </ul>
        </div>
    </div>

    <div class="mt-6 grid gap-6 xl:grid-cols-2">
        <div class="card overflow-hidden">
            <div class="flex items-center justify-between border-b border-stone-line px-6 py-4"><p class="font-medium text-forest">Berita terakhir</p><a href="<?php echo e(route('admin.posts.index')); ?>" class="text-xs text-emerald-brand">Kelola →</a></div>
            <ul class="divide-y divide-stone-line">
                <?php $__currentLoopData = $latestPosts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $p): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <li class="flex items-center justify-between gap-4 px-6 py-3">
                        <a href="<?php echo e(route('admin.posts.edit', $p)); ?>" class="truncate text-sm hover:text-emerald-brand"><?php echo e($p->title); ?></a>
                        <span class="shrink-0 rounded-full px-2 py-0.5 text-[11px] <?php echo e($p->status === 'published' ? 'bg-emerald-50 text-emerald-700' : 'bg-stone-100 text-stone-600'); ?>"><?php echo e($p->status === 'published' ? 'Terbit' : 'Draf'); ?></span>
                    </li>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </ul>
        </div>
        <div class="card overflow-hidden">
            <div class="border-b border-stone-line px-6 py-4"><p class="font-medium text-forest">Aktivitas terbaru</p></div>
            <ul class="divide-y divide-stone-line" data-testid="dashboard-activity-list">
                <?php $__empty_1 = true; $__currentLoopData = $logs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $log): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <li class="px-6 py-3 text-sm"><span class="font-medium"><?php echo e($log->user?->name ?? 'Sistem'); ?></span> <span class="text-ink/65"><?php echo e(Str::lcfirst($log->description)); ?></span><span class="block text-xs text-ink/45"><?php echo e($log->created_at->diffForHumans()); ?></span></li>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <li class="px-6 py-3 text-sm text-ink/50">Belum ada aktivitas.</li>
                <?php endif; ?>
            </ul>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script type="module">
    const d = <?php echo json_encode($postsPerMonth, 15, 512) ?>;
    new Chart(document.getElementById('postsChart'), {
        type: 'bar',
        data: { labels: d.map(x => x.label), datasets: [{ data: d.map(x => x.value), backgroundColor: '#046A38', borderRadius: 8, maxBarThickness: 42 }] },
        options: { maintainAspectRatio: false, plugins: { legend: { display: false } }, scales: { x: { grid: { display: false } }, y: { beginAtZero: true, ticks: { precision: 0 }, grid: { color: '#EFECE6' } } } },
    });
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/admin/dashboard.blade.php ENDPATH**/ ?>