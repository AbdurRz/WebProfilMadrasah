<?php $__env->startSection('title', 'Berita'); ?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => $activeCategory ? 'Kategori: '.$activeCategory->name : 'Berita & Artikel','eyebrow' => 'Kabar Madrasah','subtitle' => 'Liputan kegiatan, prestasi, dan informasi terkini dari MTsN 1 Bukittinggi.','crumbs' => ['Berita' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($activeCategory ? 'Kategori: '.$activeCategory->name : 'Berita & Artikel'),'eyebrow' => 'Kabar Madrasah','subtitle' => 'Liputan kegiatan, prestasi, dan informasi terkini dari MTsN 1 Bukittinggi.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Berita' => null])]); ?>
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

    <div class="container-x grid gap-12 py-16 lg:grid-cols-12">
        <div class="lg:col-span-8">
            <?php if($term): ?>
                <p class="mb-8 text-sm text-ink/60" data-testid="news-search-summary">Hasil pencarian “<strong class="text-forest"><?php echo e($term); ?></strong>”: <?php echo e($posts->total()); ?> berita</p>
            <?php endif; ?>
            <div class="grid gap-x-8 gap-y-12 sm:grid-cols-2" data-testid="news-list">
                <?php $__empty_1 = true; $__currentLoopData = $posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <?php if (isset($component)) { $__componentOriginal1a2825a6708c27e00d3538c2a0d29d90 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal1a2825a6708c27e00d3538c2a0d29d90 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.news-card','data' => ['post' => $post]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('news-card'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['post' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($post)]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal1a2825a6708c27e00d3538c2a0d29d90)): ?>
<?php $attributes = $__attributesOriginal1a2825a6708c27e00d3538c2a0d29d90; ?>
<?php unset($__attributesOriginal1a2825a6708c27e00d3538c2a0d29d90); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal1a2825a6708c27e00d3538c2a0d29d90)): ?>
<?php $component = $__componentOriginal1a2825a6708c27e00d3538c2a0d29d90; ?>
<?php unset($__componentOriginal1a2825a6708c27e00d3538c2a0d29d90); ?>
<?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <p class="text-ink/60" data-testid="news-empty">Belum ada berita yang sesuai.</p>
                <?php endif; ?>
            </div>
            <?php echo e($posts->links()); ?>

        </div>

        <aside class="space-y-10 lg:col-span-4">
            <form action="<?php echo e(route('news.index')); ?>" method="get" class="card p-5" data-testid="news-search-form">
                <label for="q" class="field-label">Cari berita</label>
                <div class="flex gap-2">
                    <input id="q" name="q" value="<?php echo e($term); ?>" placeholder="Kata kunci…" class="field-input" data-testid="news-search-input">
                    <?php if($activeCategory): ?><input type="hidden" name="kategori" value="<?php echo e($activeCategory->slug); ?>"><?php endif; ?>
                    <button class="btn-primary px-4" data-testid="news-search-submit">Cari</button>
                </div>
            </form>

            <div>
                <p class="eyebrow mb-4">Kategori</p>
                <ul class="space-y-1">
                    <li><a href="<?php echo e(route('news.index')); ?>" class="flex justify-between rounded-lg px-3 py-2 text-sm <?php echo e(! $activeCategory ? 'bg-forest text-white' : 'hover:bg-white'); ?>" data-testid="news-category-all">Semua</a></li>
                    <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $c): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li>
                            <a href="<?php echo e(route('news.index', ['kategori' => $c->slug])); ?>" class="flex justify-between rounded-lg px-3 py-2 text-sm <?php echo e($activeCategory?->id === $c->id ? 'bg-forest text-white' : 'hover:bg-white'); ?>" data-testid="news-category-<?php echo e($c->slug); ?>">
                                <?php echo e($c->name); ?> <span class="font-mono text-xs opacity-60"><?php echo e($c->posts_count); ?></span>
                            </a>
                        </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
            </div>

            <div>
                <p class="eyebrow mb-4">Terpopuler</p>
                <ol class="space-y-5">
                    <?php $__currentLoopData = $popular; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $p): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li class="flex gap-4">
                            <span class="font-serif text-3xl text-gold"><?php echo e($i + 1); ?></span>
                            <a href="<?php echo e(route('news.show', $p)); ?>" class="text-sm leading-6 text-forest hover:text-emerald-brand" data-testid="news-popular-<?php echo e($p->id); ?>"><?php echo e($p->title); ?></a>
                        </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ol>
            </div>
        </aside>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/news/index.blade.php ENDPATH**/ ?>