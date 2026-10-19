<?php $__env->startSection('title', 'Galeri'); ?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => 'Galeri Kegiatan','eyebrow' => 'Dokumentasi','subtitle' => 'Rekam jejak kegiatan madrasah dalam foto dan video.','crumbs' => ['Galeri' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => 'Galeri Kegiatan','eyebrow' => 'Dokumentasi','subtitle' => 'Rekam jejak kegiatan madrasah dalam foto dan video.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Galeri' => null])]); ?>
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

    <div class="container-x grid gap-8 py-16 sm:grid-cols-2 lg:grid-cols-3">
        <?php $__currentLoopData = $galleries; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $g): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <a href="<?php echo e(route('galleries.show', $g)); ?>" class="group" data-testid="gallery-card-<?php echo e($g->id); ?>">
                <div class="img-zoom relative aspect-[4/3] overflow-hidden rounded-2xl">
                    <img src="<?php echo e($g->cover_url); ?>" alt="<?php echo e($g->title); ?>" loading="lazy" class="h-full w-full object-cover">
                    <span class="absolute right-3 top-3 rounded-full bg-forest/80 px-3 py-1 font-mono text-[11px] text-white backdrop-blur"><?php echo e($g->items_count); ?> foto<?php echo e($g->has_video ? ' · video' : ''); ?></span>
                </div>
                <p class="mt-4 font-mono text-[11px] uppercase text-ink/50"><?php echo e($g->event_date?->translatedFormat('d F Y')); ?></p>
                <h2 class="mt-1 text-xl text-forest group-hover:text-emerald-brand"><?php echo e($g->title); ?></h2>
            </a>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
    <div class="container-x"><?php echo e($galleries->links()); ?></div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/galleries/index.blade.php ENDPATH**/ ?>