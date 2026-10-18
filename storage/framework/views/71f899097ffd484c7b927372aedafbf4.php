<?php $attributes ??= new \Illuminate\View\ComponentAttributeBag;

$__newAttributes = [];
$__propNames = \Illuminate\View\ComponentAttributeBag::extractPropNames((['post', 'size' => 'md']));

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

foreach (array_filter((['post', 'size' => 'md']), 'is_string', ARRAY_FILTER_USE_KEY) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
}

$__defined_vars = get_defined_vars();

foreach ($attributes->all() as $__key => $__value) {
    if (array_key_exists($__key, $__defined_vars)) unset($$__key);
}

unset($__defined_vars, $__key, $__value); ?>
<article class="group">
    <a href="<?php echo e(route('news.show', $post)); ?>" class="block" data-testid="news-card-<?php echo e($post->id); ?>">
        <div class="img-zoom relative mb-4 aspect-[16/10] overflow-hidden rounded-xl bg-sand-dark">
            <img src="<?php echo e($post->cover_url); ?>" alt="<?php echo e($post->title); ?>" loading="lazy" class="h-full w-full object-cover">
            <?php if($post->category): ?>
                <span class="absolute left-3 top-3 rounded-full bg-white/90 px-3 py-1 text-[11px] font-semibold text-emerald-brand backdrop-blur"><?php echo e($post->category->name); ?></span>
            <?php endif; ?>
        </div>
        <p class="mb-2 font-mono text-[11px] uppercase tracking-wider text-ink/50"><?php echo e($post->published_at?->translatedFormat('d F Y')); ?></p>
        <h3 class="<?php echo e($size === 'lg' ? 'text-2xl' : 'text-lg'); ?> leading-snug text-forest transition-colors group-hover:text-emerald-brand"><?php echo e($post->title); ?></h3>
        <?php if($size === 'lg'): ?><p class="mt-3 line-clamp-3 text-sm leading-6 text-ink/65"><?php echo e($post->summary); ?></p><?php endif; ?>
    </a>
</article>
<?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/components/news-card.blade.php ENDPATH**/ ?>