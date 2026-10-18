<?php $__env->startSection('title', $title); ?>

<?php
    $fmt = function ($item, $key) {
        $v = data_get($item, $key);
        return match (true) {
            $v instanceof \Carbon\CarbonInterface => $v->translatedFormat('d M Y'),
            is_bool($v) => $v ? 'Ya' : 'Tidak',
            $key === 'status' => $v === 'published' ? 'Terbit' : 'Draf',
            in_array($key, ['priority', 'category', 'level', 'group', 'role']) => Str::headline((string) $v),
            default => Str::limit((string) $v, 60) ?: '—',
        };
    };
?>

<?php $__env->startSection('content'); ?>
    <div class="mb-6 flex flex-wrap items-center justify-between gap-4">
        <form method="get" class="flex gap-2" data-testid="crud-search-form">
            <input name="q" value="<?php echo e(request('q')); ?>" placeholder="Cari <?php echo e(Str::lower($singular)); ?>…" class="field-input w-64" data-testid="crud-search-input">
            <button class="btn-ghost" data-testid="crud-search-submit">Cari</button>
        </form>
        <a href="<?php echo e(route("admin.$route.create")); ?>" class="btn-primary" data-testid="crud-create-button">+ Tambah <?php echo e($singular); ?></a>
    </div>

    <div class="card overflow-x-auto">
        <table class="w-full text-left text-sm" data-testid="crud-table">
            <thead class="border-b border-stone-line bg-sand/70 text-[11px] uppercase tracking-wider text-ink/50">
                <tr>
                    <?php $__currentLoopData = $columns; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $label): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><th class="px-5 py-3 font-semibold"><?php echo e($label); ?></th><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <th class="px-5 py-3 text-right font-semibold">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-stone-line">
                <?php $__empty_1 = true; $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr class="transition-colors hover:bg-sand/50" data-testid="crud-row-<?php echo e($item->id); ?>">
                        <?php $__currentLoopData = $columns; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $label): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <td class="px-5 py-3 <?php echo e($loop->first ? 'font-medium text-forest' : 'text-ink/70'); ?>"><?php echo e($fmt($item, $key)); ?></td>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <td class="whitespace-nowrap px-5 py-3 text-right">
                            <?php if ($__env->exists("admin.$route.row-actions", ['item' => $item])) echo $__env->make("admin.$route.row-actions", ['item' => $item], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                            <a href="<?php echo e(route("admin.$route.edit", $item->id)); ?>" class="rounded-lg px-3 py-1.5 text-xs font-medium text-emerald-brand hover:bg-emerald-50" data-testid="crud-edit-<?php echo e($item->id); ?>">Ubah</a>
                            <form method="post" action="<?php echo e(route("admin.$route.destroy", $item->id)); ?>" class="inline" x-data @submit.prevent="if (confirm('Hapus data ini? Tindakan tidak dapat dibatalkan.')) $el.submit()">
                                <?php echo csrf_field(); ?> <?php echo method_field('DELETE'); ?>
                                <button class="rounded-lg px-3 py-1.5 text-xs font-medium text-red-700 hover:bg-red-50" data-testid="crud-delete-<?php echo e($item->id); ?>">Hapus</button>
                            </form>
                        </td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr><td colspan="<?php echo e(count($columns) + 1); ?>" class="px-5 py-12 text-center text-ink/50" data-testid="crud-empty">Belum ada data.</td></tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
    <?php echo e($items->links()); ?>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/admin/crud/index.blade.php ENDPATH**/ ?>