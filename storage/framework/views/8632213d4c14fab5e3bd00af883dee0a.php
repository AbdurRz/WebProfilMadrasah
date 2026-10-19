<?php $__env->startSection('title', 'Ekstrakurikuler'); ?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => 'Ekstrakurikuler','eyebrow' => 'Kesiswaan','subtitle' => 'Wadah pengembangan bakat, minat, dan karakter peserta didik di luar jam pelajaran.','crumbs' => ['Kesiswaan' => null, 'Ekstrakurikuler' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => 'Ekstrakurikuler','eyebrow' => 'Kesiswaan','subtitle' => 'Wadah pengembangan bakat, minat, dan karakter peserta didik di luar jam pelajaran.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Kesiswaan' => null, 'Ekstrakurikuler' => null])]); ?>
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

    <div class="container-x py-16" x-data="{ cat: '' }">
        <div class="mb-10 flex flex-wrap gap-2" data-testid="ekskul-filters">
            <button @click="cat = ''" :class="cat === '' ? 'border-forest bg-forest text-white' : 'border-stone-line bg-white hover:border-emerald-brand'" class="rounded-full border px-4 py-2 text-sm transition-colors" data-testid="ekskul-filter-all">Semua</button>
            <?php $__currentLoopData = \App\Models\Extracurricular::CATEGORIES; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $l): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <button @click="cat = '<?php echo e($k); ?>'" :class="cat === '<?php echo e($k); ?>' ? 'border-forest bg-forest text-white' : 'border-stone-line bg-white hover:border-emerald-brand'" class="rounded-full border px-4 py-2 text-sm transition-colors" data-testid="ekskul-filter-<?php echo e($k); ?>"><?php echo e($l); ?></button>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
        <div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
            <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $e): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <a href="<?php echo e(route('extracurriculars.show', $e)); ?>" x-show="!cat || cat === '<?php echo e($e->category); ?>'" x-transition.opacity class="group card overflow-hidden" data-testid="ekskul-card-<?php echo e($e->id); ?>">
                    <div class="img-zoom relative aspect-[16/10] overflow-hidden">
                        <img src="<?php echo e($e->cover_url); ?>" alt="<?php echo e($e->name); ?>" loading="lazy" class="h-full w-full object-cover">
                        <span class="absolute left-3 top-3 rounded-full bg-white/90 px-3 py-1 text-[11px] font-semibold text-emerald-brand backdrop-blur"><?php echo e(\App\Models\Extracurricular::CATEGORIES[$e->category]); ?></span>
                    </div>
                    <div class="p-6">
                        <h2 class="text-2xl text-forest transition-colors group-hover:text-emerald-brand"><?php echo e($e->name); ?></h2>
                        <dl class="mt-4 space-y-1.5 text-sm">
                            <div class="flex gap-2"><dt class="w-20 shrink-0 text-ink/50">Pembina</dt><dd><?php echo e($e->coach_name ?: '—'); ?></dd></div>
                            <div class="flex gap-2"><dt class="w-20 shrink-0 text-ink/50">Jadwal</dt><dd class="font-medium text-emerald-brand"><?php echo e($e->schedule ?: '—'); ?></dd></div>
                        </dl>
                    </div>
                </a>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/extracurriculars/index.blade.php ENDPATH**/ ?>