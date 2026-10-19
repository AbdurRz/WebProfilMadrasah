<?php $attributes ??= new \Illuminate\View\ComponentAttributeBag;

$__newAttributes = [];
$__propNames = \Illuminate\View\ComponentAttributeBag::extractPropNames((['title', 'eyebrow' => null, 'subtitle' => null, 'crumbs' => []]));

foreach ($attributes->all() as $__key => $__value) {
    if (in_array($__key, $__propNames)) {
        $$__key = $$__key ?? $__value;
    } else {
        $__newAttributes[$__key] = $__value;
    }
}

$attributes = new \Illuminate\View\ComponentAttributeBag($__newAttributes);

unset($__propNames);
unset($__newAttributes);

foreach (array_filter((['title', 'eyebrow' => null, 'subtitle' => null, 'crumbs' => []]), 'is_string', ARRAY_FILTER_USE_KEY) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
}

$__defined_vars = get_defined_vars();

foreach ($attributes->all() as $__key => $__value) {
    if (array_key_exists($__key, $__defined_vars)) unset($$__key);
}

unset($__defined_vars, $__key, $__value); ?>
<section class="relative overflow-hidden bg-forest text-white grain">
    <div class="songket absolute inset-0"></div>
    <div class="absolute -right-24 -top-24 h-80 w-80 rounded-full bg-emerald-brand/60 blur-3xl"></div>
    <div class="container-x relative py-16 sm:py-20">
        <nav class="rise mb-6 flex flex-wrap items-center gap-2 text-xs text-white/60" aria-label="Breadcrumb" data-testid="breadcrumb">
            <a href="<?php echo e(route('home')); ?>" class="hover:text-gold">Beranda</a>
            <?php $__currentLoopData = $crumbs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $label => $url): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <span class="text-gold">/</span>
                <?php if($url): ?><a href="<?php echo e($url); ?>" class="hover:text-gold"><?php echo e($label); ?></a><?php else: ?><span class="text-white/85"><?php echo e($label); ?></span><?php endif; ?>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </nav>
        <?php if($eyebrow): ?><p class="rise rise-1 mb-3 text-[11px] font-semibold uppercase tracking-[0.25em] text-gold"><?php echo e($eyebrow); ?></p><?php endif; ?>
        <h1 class="rise rise-2 max-w-4xl text-4xl leading-[1.1] sm:text-5xl lg:text-6xl" data-testid="page-title"><?php echo e($title); ?></h1>
        <?php if($subtitle): ?><p class="rise rise-3 mt-5 max-w-2xl text-base leading-7 text-white/70 md:text-lg"><?php echo e($subtitle); ?></p><?php endif; ?>
        <?php echo e($slot); ?>

    </div>
</section>
<?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/components/page-hero.blade.php ENDPATH**/ ?>