<?php $__env->startSection('title', 'Agenda'); ?>

<?php
    $byDay = $events->groupBy(fn ($e) => $e->starts_at->day);
    $offset = ($month->dayOfWeekIso - 1);
    $colors = ['akademik' => 'bg-emerald-brand', 'keagamaan' => 'bg-gold', 'kesiswaan' => 'bg-sky-600', 'umum' => 'bg-stone-500'];
?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => 'Agenda & Kalender Akademik','eyebrow' => 'Kalender','subtitle' => 'Jadwal kegiatan akademik, keagamaan, dan kesiswaan madrasah.','crumbs' => ['Agenda' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => 'Agenda & Kalender Akademik','eyebrow' => 'Kalender','subtitle' => 'Jadwal kegiatan akademik, keagamaan, dan kesiswaan madrasah.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Agenda' => null])]); ?>
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
            <div class="mb-6 flex items-center justify-between">
                <a href="<?php echo e(route('agenda', ['bulan' => $month->copy()->subMonth()->format('Y-m')])); ?>" class="btn-ghost px-4 py-2" data-testid="agenda-prev-month">←</a>
                <h2 class="text-2xl text-forest sm:text-3xl" data-testid="agenda-month-title"><?php echo e($month->translatedFormat('F Y')); ?></h2>
                <a href="<?php echo e(route('agenda', ['bulan' => $month->copy()->addMonth()->format('Y-m')])); ?>" class="btn-ghost px-4 py-2" data-testid="agenda-next-month">→</a>
            </div>
            <div class="overflow-hidden rounded-2xl border border-stone-line bg-white" data-testid="agenda-calendar">
                <div class="grid grid-cols-7 border-b border-stone-line bg-sand text-center text-[11px] font-semibold uppercase tracking-wider text-ink/50">
                    <?php $__currentLoopData = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $d): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><div class="py-3"><?php echo e($d); ?></div><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
                <div class="grid grid-cols-7">
                    <?php for($i = 0; $i < $offset; $i++): ?><div class="min-h-24 border-b border-r border-stone-line bg-sand/50"></div><?php endfor; ?>
                    <?php for($d = 1; $d <= $month->daysInMonth; $d++): ?>
                        <?php $isToday = $month->copy()->day($d)->isToday(); ?>
                        <div class="min-h-24 border-b border-r border-stone-line p-1.5 sm:p-2">
                            <p class="mb-1 font-mono text-xs <?php echo e($isToday ? 'inline-grid h-6 w-6 place-items-center rounded-full bg-forest text-white' : 'text-ink/50'); ?>"><?php echo e($d); ?></p>
                            <?php $__currentLoopData = $byDay->get($d, []); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $e): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <p class="mb-1 truncate rounded px-1.5 py-0.5 text-[10px] font-medium text-white sm:text-[11px] <?php echo e($colors[$e->category]); ?>" title="<?php echo e($e->title); ?>"><?php echo e($e->title); ?></p>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    <?php endfor; ?>
                </div>
            </div>
            <div class="mt-4 flex flex-wrap gap-4 text-xs text-ink/60">
                <?php $__currentLoopData = $colors; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $c): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><span class="flex items-center gap-2"><span class="h-2.5 w-2.5 rounded-sm <?php echo e($c); ?>"></span><?php echo e(ucfirst($k)); ?></span><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>

            <div class="mt-12 space-y-3">
                <p class="eyebrow mb-4">Kegiatan bulan ini</p>
                <?php $__empty_1 = true; $__currentLoopData = $events; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $e): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <div class="card flex gap-5 p-5" data-testid="agenda-event-<?php echo e($e->id); ?>">
                        <div class="w-14 text-center"><p class="font-mono text-2xl font-bold text-emerald-brand"><?php echo e($e->starts_at->format('d')); ?></p><p class="text-[10px] uppercase text-ink/50"><?php echo e($e->starts_at->translatedFormat('D')); ?></p></div>
                        <div>
                            <p class="font-medium text-forest"><?php echo e($e->title); ?></p>
                            <p class="text-sm text-ink/55"><?php echo e($e->starts_at->format('H.i')); ?><?php echo e($e->ends_at ? ' – '.$e->ends_at->translatedFormat($e->ends_at->isSameDay($e->starts_at) ? 'H.i' : 'd M, H.i') : ''); ?> WIB · <?php echo e($e->location); ?></p>
                            <?php if($e->description): ?><p class="mt-2 text-sm text-ink/65"><?php echo e($e->description); ?></p><?php endif; ?>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <p class="text-sm text-ink/60" data-testid="agenda-empty">Tidak ada kegiatan pada bulan ini.</p>
                <?php endif; ?>
            </div>
        </div>

        <aside class="lg:col-span-4">
            <div class="sticky top-28 rounded-2xl bg-forest p-7 text-white">
                <p class="text-[11px] font-semibold uppercase tracking-[0.25em] text-gold">Segera</p>
                <h3 class="mt-2 text-2xl">Agenda terdekat</h3>
                <ul class="mt-6 space-y-5">
                    <?php $__currentLoopData = $upcoming; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $e): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li class="flex gap-4 border-b border-white/10 pb-5 last:border-0">
                            <span class="font-mono text-sm text-gold"><?php echo e($e->starts_at->translatedFormat('d M')); ?></span>
                            <span class="text-sm leading-6"><?php echo e($e->title); ?></span>
                        </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
            </div>
        </aside>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/agenda.blade.php ENDPATH**/ ?>