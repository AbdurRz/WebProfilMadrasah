<?php $__env->startSection('title', $gallery->title); ?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => $gallery->title,'eyebrow' => 'Galeri','subtitle' => $gallery->description,'crumbs' => ['Galeri' => route('galleries.index'), $gallery->title => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($gallery->title),'eyebrow' => 'Galeri','subtitle' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($gallery->description),'crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Galeri' => route('galleries.index'), $gallery->title => null])]); ?>
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

    <div class="container-x py-16" x-data="{ open: false, src: '', caption: '' }" @keydown.escape.window="open = false">
        <?php if($gallery->youtube_id): ?>
            <div class="mb-12 aspect-video overflow-hidden rounded-2xl bg-forest" data-testid="gallery-video">
                <iframe class="h-full w-full" src="https://www.youtube.com/embed/<?php echo e($gallery->youtube_id); ?>" title="<?php echo e($gallery->title); ?>" allowfullscreen loading="lazy"></iframe>
            </div>
        <?php endif; ?>
        <div class="columns-1 gap-4 sm:columns-2 lg:columns-3 [&>*]:mb-4">
            <?php $__currentLoopData = $gallery->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <button @click="open = true; src = <?php echo \Illuminate\Support\Js::from($item->url)->toHtml() ?>; caption = <?php echo \Illuminate\Support\Js::from($item->caption)->toHtml() ?>" class="img-zoom block w-full overflow-hidden rounded-xl" data-testid="gallery-photo-<?php echo e($item->id); ?>">
                    <img src="<?php echo e($item->url); ?>" alt="<?php echo e($item->caption); ?>" loading="lazy" class="w-full">
                </button>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>

        <div x-cloak x-show="open" x-transition.opacity @click="open = false" class="fixed inset-0 z-[70] grid place-items-center bg-forest-deep/90 p-6 backdrop-blur" data-testid="gallery-lightbox">
            <figure @click.stop class="max-w-5xl">
                <img :src="src" alt="" class="max-h-[80vh] rounded-xl">
                <figcaption class="mt-3 text-center text-sm text-white/70" x-text="caption"></figcaption>
            </figure>
            <button @click="open = false" class="absolute right-6 top-6 grid h-11 w-11 place-items-center rounded-full bg-white/10 text-white" data-testid="gallery-lightbox-close">✕</button>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/galleries/show.blade.php ENDPATH**/ ?>