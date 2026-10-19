<?php $__env->startSection('title', $code.' — '.$heading); ?>

<?php $__env->startSection('content'); ?>
    <section class="relative overflow-hidden bg-forest text-white grain">
        <div class="songket absolute inset-0"></div>
        <div class="container-x relative py-24 sm:py-32">
            <p class="font-mono text-7xl font-bold text-gold sm:text-8xl" data-testid="error-code"><?php echo e($code); ?></p>
            <h1 class="mt-6 max-w-2xl text-4xl leading-tight sm:text-5xl" data-testid="error-heading"><?php echo e($heading); ?></h1>
            <p class="mt-4 max-w-xl text-white/70"><?php echo e($message); ?></p>
            <div class="mt-10 flex flex-wrap gap-3">
                <a href="<?php echo e(url()->previous() !== url()->current() ? url()->previous() : route('home')); ?>" class="btn border border-white/25 text-white hover:bg-white hover:text-forest" data-testid="error-back-button">Kembali</a>
                <a href="<?php echo e(route('home')); ?>" class="btn-gold" data-testid="error-home-button">Ke beranda</a>
            </div>
        </div>
    </section>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/errors/layout.blade.php ENDPATH**/ ?>