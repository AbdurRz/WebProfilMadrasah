<?php $__env->startSection('title', 'Halaman Profil'); ?>

<?php $__env->startSection('content'); ?>
    <p class="mb-6 max-w-2xl text-sm text-ink/60">Konten statis yang tampil di halaman Profil dan Beranda (sambutan, sejarah, visi, misi, struktur organisasi).</p>
    <div class="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
        <?php $__currentLoopData = $pages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $page): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <a href="<?php echo e(route('admin.pages.edit', $page)); ?>" class="card group p-6 transition-[border-color,transform] hover:-translate-y-0.5 hover:border-emerald-brand/40" data-testid="page-card-<?php echo e($page->key); ?>">
                <p class="font-mono text-[11px] uppercase text-gold"><?php echo e($page->key); ?></p>
                <p class="mt-1 font-serif text-xl text-forest"><?php echo e($page->title); ?></p>
                <p class="mt-2 line-clamp-2 text-sm text-ink/55"><?php echo e(strip_tags($page->content)); ?></p>
                <p class="mt-4 text-xs text-ink/45">Diperbarui <?php echo e($page->updated_at->diffForHumans()); ?></p>
            </a>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/admin/pages/index.blade.php ENDPATH**/ ?>