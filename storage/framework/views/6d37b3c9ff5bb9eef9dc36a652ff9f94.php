<?php $__env->startSection('title', 'Pengumuman'); ?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => 'Pengumuman Resmi','eyebrow' => 'Papan Informasi','subtitle' => 'Surat edaran, jadwal, dan informasi penting bagi peserta didik dan orang tua/wali.','crumbs' => ['Pengumuman' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => 'Pengumuman Resmi','eyebrow' => 'Papan Informasi','subtitle' => 'Surat edaran, jadwal, dan informasi penting bagi peserta didik dan orang tua/wali.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Pengumuman' => null])]); ?>
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

    <div class="container-x max-w-4xl py-16">
        <div class="divide-y divide-stone-line rounded-2xl border border-stone-line bg-white" data-testid="announcement-list">
            <?php $__empty_1 = true; $__currentLoopData = $announcements; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $a): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <a href="<?php echo e(route('announcements.show', $a)); ?>" class="group grid gap-4 p-6 transition-colors hover:bg-sand sm:grid-cols-[110px_1fr_auto] sm:items-center" data-testid="announcement-item-<?php echo e($a->id); ?>">
                    <div class="font-mono text-xs uppercase text-ink/50"><?php echo e($a->created_at->translatedFormat('d M Y')); ?></div>
                    <div>
                        <?php if (isset($component)) { $__componentOriginalb3f3930a96171a12366c9551b2dd3c07 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalb3f3930a96171a12366c9551b2dd3c07 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.priority-badge','data' => ['priority' => $a->priority]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('priority-badge'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['priority' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($a->priority)]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginalb3f3930a96171a12366c9551b2dd3c07)): ?>
<?php $attributes = $__attributesOriginalb3f3930a96171a12366c9551b2dd3c07; ?>
<?php unset($__attributesOriginalb3f3930a96171a12366c9551b2dd3c07); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalb3f3930a96171a12366c9551b2dd3c07)): ?>
<?php $component = $__componentOriginalb3f3930a96171a12366c9551b2dd3c07; ?>
<?php unset($__componentOriginalb3f3930a96171a12366c9551b2dd3c07); ?>
<?php endif; ?>
                        <p class="mt-2 font-serif text-xl leading-snug text-forest group-hover:text-emerald-brand"><?php echo e($a->title); ?></p>
                        <p class="mt-1 text-xs text-ink/50">Berlaku <?php echo e($a->starts_at?->translatedFormat('d M') ?? '—'); ?> – <?php echo e($a->ends_at?->translatedFormat('d M Y') ?? '—'); ?></p>
                    </div>
                    <span class="text-gold transition-transform group-hover:translate-x-1">→</span>
                </a>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                <p class="p-8 text-ink/60">Belum ada pengumuman.</p>
            <?php endif; ?>
        </div>
        <?php echo e($announcements->links()); ?>

    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/announcements/index.blade.php ENDPATH**/ ?>