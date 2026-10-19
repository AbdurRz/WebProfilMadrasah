<?php $__env->startSection('title', 'Pendaftar PPDB'); ?>

<?php
    $badge = ['baru' => 'bg-sky-50 text-sky-700', 'diverifikasi' => 'bg-amber-50 text-amber-800', 'diterima' => 'bg-emerald-50 text-emerald-700', 'ditolak' => 'bg-red-50 text-red-700'];
?>

<?php $__env->startSection('content'); ?>
    <div class="mb-6 grid gap-3 sm:grid-cols-2 xl:grid-cols-5">
        <a href="<?php echo e(route('admin.ppdb.index')); ?>" class="card p-4 <?php echo e(! $status ? 'border-forest bg-forest text-white' : ''); ?>" data-testid="ppdb-filter-all">
            <p class="text-xs <?php echo e(! $status ? 'text-white/60' : 'text-ink/55'); ?>">Semua pendaftar</p>
            <p class="mt-1 font-mono text-2xl font-bold <?php echo e(! $status ? 'text-gold' : 'text-forest'); ?>"><?php echo e($counts->sum()); ?></p>
        </a>
        <?php $__currentLoopData = \App\Models\PpdbRegistration::STATUSES; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $l): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <a href="<?php echo e(route('admin.ppdb.index', ['status' => $k])); ?>" class="card p-4 <?php echo e($status === $k ? 'border-forest bg-forest text-white' : ''); ?>" data-testid="ppdb-filter-<?php echo e($k); ?>">
                <p class="text-xs <?php echo e($status === $k ? 'text-white/60' : 'text-ink/55'); ?>"><?php echo e($l); ?></p>
                <p class="mt-1 font-mono text-2xl font-bold <?php echo e($status === $k ? 'text-gold' : 'text-forest'); ?>" data-testid="ppdb-count-<?php echo e($k); ?>"><?php echo e($counts[$k] ?? 0); ?></p>
            </a>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>

    <div class="mb-6 flex flex-wrap items-center justify-between gap-4">
        <form method="get" class="flex gap-2">
            <?php if($status): ?><input type="hidden" name="status" value="<?php echo e($status); ?>"><?php endif; ?>
            <input name="q" value="<?php echo e($term); ?>" placeholder="Cari nama, NISN, no. pendaftaran…" class="field-input w-72" data-testid="ppdb-search-input">
            <button class="btn-ghost" data-testid="ppdb-search-submit">Cari</button>
        </form>
        <a href="<?php echo e(route('admin.ppdb.export')); ?>" class="btn-primary" data-testid="ppdb-export-button">Ekspor CSV / Excel</a>
    </div>

    <div class="card overflow-x-auto">
        <table class="w-full text-left text-sm" data-testid="ppdb-table">
            <thead class="border-b border-stone-line bg-sand/70 text-[11px] uppercase tracking-wider text-ink/50">
                <tr><th class="px-5 py-3">No. Pendaftaran</th><th class="px-5 py-3">Nama</th><th class="px-5 py-3">NISN</th><th class="px-5 py-3">Asal Sekolah</th><th class="px-5 py-3">Tanggal</th><th class="px-5 py-3">Status</th><th class="px-5 py-3 text-right">Aksi</th></tr>
            </thead>
            <tbody class="divide-y divide-stone-line">
                <?php $__empty_1 = true; $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $r): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr class="hover:bg-sand/50" data-testid="ppdb-row-<?php echo e($r->id); ?>">
                        <td class="px-5 py-3 font-mono text-xs"><?php echo e($r->registration_number); ?></td>
                        <td class="px-5 py-3 font-medium text-forest"><?php echo e($r->full_name); ?> <span class="text-xs text-ink/45">(<?php echo e($r->gender); ?>)</span></td>
                        <td class="px-5 py-3 font-mono text-xs"><?php echo e($r->nisn); ?></td>
                        <td class="px-5 py-3 text-ink/70"><?php echo e($r->previous_school); ?></td>
                        <td class="px-5 py-3 text-ink/70"><?php echo e($r->created_at->translatedFormat('d M Y')); ?></td>
                        <td class="px-5 py-3"><span class="rounded-full px-2.5 py-0.5 text-[11px] font-semibold <?php echo e($badge[$r->status]); ?>"><?php echo e($r->status_label); ?></span></td>
                        <td class="px-5 py-3 text-right"><a href="<?php echo e(route('admin.ppdb.show', $r)); ?>" class="rounded-lg px-3 py-1.5 text-xs font-medium text-emerald-brand hover:bg-emerald-50" data-testid="ppdb-review-<?php echo e($r->id); ?>">Tinjau</a></td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr><td colspan="7" class="px-5 py-12 text-center text-ink/50" data-testid="ppdb-empty">Belum ada pendaftar.</td></tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
    <?php echo e($items->links()); ?>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/admin/ppdb/index.blade.php ENDPATH**/ ?>