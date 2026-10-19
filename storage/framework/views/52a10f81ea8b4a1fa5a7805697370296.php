<?php $__env->startSection('title', 'Prestasi'); ?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => 'Prestasi Peserta Didik','eyebrow' => 'Capaian','subtitle' => 'Dokumentasi prestasi akademik, keagamaan, dan non-akademik warga madrasah.','crumbs' => ['Prestasi' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => 'Prestasi Peserta Didik','eyebrow' => 'Capaian','subtitle' => 'Dokumentasi prestasi akademik, keagamaan, dan non-akademik warga madrasah.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Prestasi' => null])]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginala9d931d4f11b4d2850df99e991db1dca)): ?>
<?php $attributes = $__attributesOriginala9d931d4f11b4d2850df99e991db1dca; ?>
<?php unset($__attributesOriginala9d931d4f11b4d2850df99e991db1dca); ?>
<?php endif; ?>
<?php if (isset($__componentOriginala9d931d4f11b4d2850df99e991db1dca)): ?>
<?php $component = $__componentOriginala9d931d4f11b4d2850df99e991db1dca; ?>
<?php unset($__componentOriginala9d931d4f11b4d2850df99e991db1dca); ?>
<?php endif; ?>

    <div class="container-x py-16">
        <div class="mb-10 flex flex-wrap gap-2" data-testid="achievement-filters">
            <?php $__currentLoopData = ['' => 'Semua', 'kota' => 'Kota', 'provinsi' => 'Provinsi', 'nasional' => 'Nasional', 'internasional' => 'Internasional']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $l): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <a href="<?php echo e(route('achievements', array_filter(['tingkat' => $k]))); ?>" class="rounded-full border px-4 py-2 text-sm transition-colors <?php echo e((is_string(request('tingkat')) ? request('tingkat') : '') === $k ? 'border-forest bg-forest text-white' : 'border-stone-line bg-white hover:border-emerald-brand'); ?>" data-testid="achievement-filter-<?php echo e($k ?: 'all'); ?>"><?php echo e($l); ?></a>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
        <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            <?php $__empty_1 = true; $__currentLoopData = $achievements; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $a): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <div class="card group flex overflow-hidden" data-testid="achievement-card-<?php echo e($a->id); ?>">
                    <div class="img-zoom w-32 shrink-0 overflow-hidden"><img src="<?php echo e($a->image_url); ?>" alt="" loading="lazy" class="h-full w-full object-cover"></div>
                    <div class="p-5">
                        <p class="font-mono text-[11px] uppercase text-gold"><?php echo e($a->year); ?> · <?php echo e($a->level); ?></p>
                        <p class="mt-1 font-serif text-lg leading-snug text-forest"><?php echo e($a->rank); ?></p>
                        <p class="text-sm font-medium"><?php echo e($a->title); ?></p>
                        <p class="mt-2 text-xs text-ink/55"><?php echo e($a->student_name); ?></p>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                <p class="text-ink/60" data-testid="achievement-empty">Belum ada data prestasi.</p>
            <?php endif; ?>
        </div>
        <?php echo e($achievements->links()); ?>

    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/achievements.blade.php ENDPATH**/ ?>