<?php $__env->startSection('title', 'Fasilitas'); ?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => 'Sarana & Prasarana','eyebrow' => 'Profil','subtitle' => 'Lingkungan belajar yang mendukung pembelajaran, ibadah, dan pengembangan diri.','crumbs' => ['Profil' => route('profile'), 'Fasilitas' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => 'Sarana & Prasarana','eyebrow' => 'Profil','subtitle' => 'Lingkungan belajar yang mendukung pembelajaran, ibadah, dan pengembangan diri.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Profil' => route('profile'), 'Fasilitas' => null])]); ?>
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

    <div class="container-x grid gap-8 py-20 md:grid-cols-2 lg:grid-cols-3">
        <?php $__currentLoopData = $facilities; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $f): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="group" data-testid="facility-card-<?php echo e($f->id); ?>">
                <div class="img-zoom aspect-[4/3] overflow-hidden rounded-2xl <?php echo e($i % 3 === 1 ? 'rounded-tr-[4rem]' : ''); ?>">
                    <img src="<?php echo e($f->image_url); ?>" alt="<?php echo e($f->name); ?>" loading="lazy" class="h-full w-full object-cover">
                </div>
                <p class="mt-5 font-mono text-xs text-gold"><?php echo e(str_pad($i + 1, 2, '0', STR_PAD_LEFT)); ?></p>
                <h2 class="mt-1 text-2xl text-forest"><?php echo e($f->name); ?></h2>
                <p class="mt-2 text-sm leading-7 text-ink/65"><?php echo e($f->description); ?></p>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/facilities.blade.php ENDPATH**/ ?>