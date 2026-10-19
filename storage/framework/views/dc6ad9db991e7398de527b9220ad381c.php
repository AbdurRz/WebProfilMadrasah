<?php $__env->startSection('title', 'OSIM'); ?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => 'Organisasi Siswa Intra Madrasah','eyebrow' => 'Kesiswaan','subtitle' => 'OSIM menjadi wadah kepemimpinan, aspirasi, dan pengabdian peserta didik MTsN 1 Bukittinggi.','crumbs' => ['Kesiswaan' => null, 'OSIM' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => 'Organisasi Siswa Intra Madrasah','eyebrow' => 'Kesiswaan','subtitle' => 'OSIM menjadi wadah kepemimpinan, aspirasi, dan pengabdian peserta didik MTsN 1 Bukittinggi.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Kesiswaan' => null, 'OSIM' => null])]); ?>
        <?php if($periods->count() > 1): ?>
            <form method="get" class="rise rise-4 mt-8 flex items-center gap-3">
                <label for="periode" class="text-sm text-white/70">Periode</label>
                <select id="periode" name="periode" onchange="this.form.submit()" class="rounded-full border border-white/20 bg-white/10 px-4 py-2 text-sm text-white [&>option]:text-ink" data-testid="osim-period-select">
                    <?php $__currentLoopData = $periods; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $p): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><option value="<?php echo e($p); ?>" <?php if($p === $period): echo 'selected'; endif; ?>><?php echo e($p); ?></option><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </select>
            </form>
        <?php endif; ?>
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

    <div class="container-x py-16">
        <?php if($page): ?>
            <section class="grid gap-10 lg:grid-cols-12" data-testid="osim-about">
                <div class="lg:col-span-4"><p class="eyebrow">Tentang OSIM</p><h2 class="mt-3 text-3xl text-forest"><?php echo e($page->title); ?></h2></div>
                <div class="prose-madrasah lg:col-span-8"><?php echo $page->content; ?></div>
            </section>
        <?php endif; ?>

        <section class="mt-20" data-testid="osim-structure">
            <p class="eyebrow">Pengurus periode <?php echo e($period); ?></p>
            <div class="mt-8 flex flex-wrap justify-center gap-6">
                <?php $__currentLoopData = $leaders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $m): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="w-64 rounded-2xl bg-forest p-6 text-center text-white" data-testid="osim-leader-<?php echo e($m->id); ?>">
                        <?php if($m->photo_url): ?><img src="<?php echo e($m->photo_url); ?>" alt="<?php echo e($m->name); ?>" class="mx-auto h-24 w-24 rounded-full border-2 border-gold object-cover"><?php else: ?><div class="mx-auto grid h-24 w-24 place-items-center rounded-full border-2 border-gold bg-emerald-brand font-serif text-3xl"><?php echo e(Str::substr($m->name, 0, 1)); ?></div><?php endif; ?>
                        <p class="mt-4 text-[11px] font-semibold uppercase tracking-[0.2em] text-gold"><?php echo e($m->position); ?></p>
                        <p class="mt-1 font-serif text-xl"><?php echo e($m->name); ?></p>
                        <p class="text-xs text-white/60">Kelas <?php echo e($m->class_name); ?></p>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
            <?php if($leaders->isNotEmpty() && $members->isNotEmpty()): ?><div class="mx-auto my-6 h-10 w-px bg-gold"></div><?php endif; ?>
            <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                <?php $__currentLoopData = $members; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $m): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="card flex items-center gap-4 p-4" data-testid="osim-member-<?php echo e($m->id); ?>">
                        <?php if($m->photo_url): ?><img src="<?php echo e($m->photo_url); ?>" alt="" class="h-12 w-12 rounded-full object-cover"><?php else: ?><div class="grid h-12 w-12 shrink-0 place-items-center rounded-full bg-sand-dark font-serif text-emerald-brand"><?php echo e(Str::substr($m->name, 0, 1)); ?></div><?php endif; ?>
                        <div class="min-w-0">
                            <p class="truncate font-medium text-forest"><?php echo e($m->name); ?></p>
                            <p class="text-xs text-emerald-brand"><?php echo e($m->position); ?></p>
                            <p class="text-[11px] text-ink/50">Kelas <?php echo e($m->class_name); ?></p>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
            <?php if($leaders->isEmpty() && $members->isEmpty()): ?><p class="text-sm text-ink/60" data-testid="osim-empty">Data pengurus belum tersedia.</p><?php endif; ?>
        </section>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/osim.blade.php ENDPATH**/ ?>