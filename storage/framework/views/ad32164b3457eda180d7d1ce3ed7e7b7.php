<?php $__env->startSection('title', 'Guru & Tenaga Kependidikan'); ?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => 'Guru & Tenaga Kependidikan','eyebrow' => 'Profil','subtitle' => 'Pendidik dan tenaga kependidikan yang membersamai tumbuh kembang peserta didik.','crumbs' => ['Profil' => route('profile'), 'Guru & Tendik' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => 'Guru & Tenaga Kependidikan','eyebrow' => 'Profil','subtitle' => 'Pendidik dan tenaga kependidikan yang membersamai tumbuh kembang peserta didik.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Profil' => route('profile'), 'Guru & Tendik' => null])]); ?>
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

    <div class="container-x py-20" x-data="{ q: '' }">
        <div class="mb-10 flex flex-wrap items-center justify-between gap-4">
            <p class="text-sm text-ink/60"><span class="font-mono text-ink"><?php echo e($teachers->count()); ?></span> orang terdaftar</p>
            <input x-model="q" type="search" placeholder="Cari nama atau mapel…" class="field-input max-w-xs" data-testid="teacher-search-input">
        </div>
        <div class="grid gap-5 sm:grid-cols-2 lg:grid-cols-4">
            <?php $__currentLoopData = $teachers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $t): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div x-show="!q || <?php echo \Illuminate\Support\Js::from(Str::lower($t->name.' '.$t->subject.' '.$t->position))->toHtml() ?>.includes(q.toLowerCase())" class="card group p-6 transition-[border-color,transform] hover:-translate-y-1 hover:border-emerald-brand/40" data-testid="teacher-card-<?php echo e($t->id); ?>">
                    <?php if($t->photo_url): ?>
                        <img src="<?php echo e($t->photo_url); ?>" alt="<?php echo e($t->name); ?>" class="mb-5 h-16 w-16 rounded-full object-cover">
                    <?php else: ?>
                        <div class="mb-5 grid h-16 w-16 place-items-center rounded-full bg-sand-dark font-serif text-xl text-emerald-brand"><?php echo e(Str::of($t->name)->replaceMatches('/^(Drs?\.|Hj?\.|Ust\.)\s*/', '')->substr(0, 1)); ?></div>
                    <?php endif; ?>
                    <p class="font-serif text-lg leading-snug text-forest"><?php echo e($t->name); ?></p>
                    <p class="mt-1 text-sm text-emerald-brand"><?php echo e($t->position); ?></p>
                    <?php if($t->subject): ?><p class="mt-3 text-xs text-ink/55">Mapel: <?php echo e($t->subject); ?></p><?php endif; ?>
                    <?php if($t->nip): ?><p class="mt-1 font-mono text-[11px] text-ink/40">NIP <?php echo e($t->nip); ?></p><?php endif; ?>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/teachers.blade.php ENDPATH**/ ?>