<?php $__env->startSection('title', $post->title); ?>
<?php $__env->startSection('description', $post->summary); ?>

<?php $__env->startSection('content'); ?>
    <article>
        <header class="container-x max-w-4xl pt-14 text-center">
            <nav class="mb-8 text-xs text-ink/50" data-testid="breadcrumb">
                <a href="<?php echo e(route('home')); ?>" class="hover:text-emerald-brand">Beranda</a> <span class="text-gold">/</span>
                <a href="<?php echo e(route('news.index')); ?>" class="hover:text-emerald-brand">Berita</a>
                <?php if($post->category): ?><span class="text-gold">/</span> <a href="<?php echo e(route('news.index', ['kategori' => $post->category->slug])); ?>" class="hover:text-emerald-brand"><?php echo e($post->category->name); ?></a><?php endif; ?>
            </nav>
            <h1 class="rise text-3xl leading-tight text-forest sm:text-5xl" data-testid="news-title"><?php echo e($post->title); ?></h1>
            <p class="rise rise-1 mt-6 text-sm text-ink/55">
                <span class="font-mono"><?php echo e($post->published_at?->translatedFormat('l, d F Y')); ?></span> · <?php echo e($post->author?->name ?? 'Humas'); ?> · <span data-testid="news-views"><?php echo e(number_format($post->views, 0, ',', '.')); ?></span> kali dibaca
            </p>
        </header>
        <div class="container-x mt-10 max-w-5xl">
            <img src="<?php echo e($post->cover_url); ?>" alt="<?php echo e($post->title); ?>" class="rise rise-2 aspect-[16/8] w-full rounded-[1.75rem] object-cover">
        </div>
        <div class="container-x mt-12 max-w-3xl">
            <?php if($post->excerpt): ?><p class="mb-8 font-serif text-xl leading-relaxed text-forest"><?php echo e($post->excerpt); ?></p><?php endif; ?>
            <div class="prose-madrasah" data-testid="news-content"><?php echo $post->content; ?></div>
            <div class="mt-12 flex flex-wrap items-center gap-3 border-t border-stone-line pt-6 text-sm" x-data="{ copied: false }">
                <span class="text-ink/55">Bagikan:</span>
                <a href="https://wa.me/?text=<?php echo e(urlencode($post->title.' '.url()->current())); ?>" target="_blank" rel="noopener" class="btn-ghost px-4 py-1.5" data-testid="share-whatsapp">WhatsApp</a>
                <a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo e(urlencode(url()->current())); ?>" target="_blank" rel="noopener" class="btn-ghost px-4 py-1.5" data-testid="share-facebook">Facebook</a>
                <button @click="navigator.clipboard.writeText(location.href); copied = true; setTimeout(() => copied = false, 2000)" class="btn-ghost px-4 py-1.5" data-testid="share-copy-link"><span x-text="copied ? 'Tersalin ✓' : 'Salin tautan'"></span></button>
            </div>
        </div>
    </article>

    <?php if($related->isNotEmpty()): ?>
        <section class="container-x mt-24">
            <p class="eyebrow">Berita terkait</p>
            <div class="mt-8 grid gap-8 md:grid-cols-3">
                <?php $__currentLoopData = $related; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $r): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><?php if (isset($component)) { $__componentOriginal1a2825a6708c27e00d3538c2a0d29d90 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal1a2825a6708c27e00d3538c2a0d29d90 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.news-card','data' => ['post' => $r]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('news-card'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['post' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($r)]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal1a2825a6708c27e00d3538c2a0d29d90)): ?>
<?php $attributes = $__attributesOriginal1a2825a6708c27e00d3538c2a0d29d90; ?>
<?php unset($__attributesOriginal1a2825a6708c27e00d3538c2a0d29d90); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal1a2825a6708c27e00d3538c2a0d29d90)): ?>
<?php $component = $__componentOriginal1a2825a6708c27e00d3538c2a0d29d90; ?>
<?php unset($__componentOriginal1a2825a6708c27e00d3538c2a0d29d90); ?>
<?php endif; ?><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </section>
    <?php endif; ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/news/show.blade.php ENDPATH**/ ?>