<?php $__env->startSection('title', 'Statistik Madrasah'); ?>

<?php
    $sum = fn ($g) => $data->get($g, collect())->sum('value');
    $chart = fn ($g) => ['labels' => $data->get($g, collect())->pluck('label'), 'values' => $data->get($g, collect())->pluck('value')];
    $levelLabels = $achievementLevels->keys()->map(fn ($k) => ucfirst($k));
    [$siswaChart, $guruChart, $lulusanChart] = [$chart('siswa'), $chart('guru'), $chart('lulusan')];
?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => 'Statistik Madrasah','eyebrow' => 'Data Terbuka','subtitle' => 'Data peserta didik, pendidik, rombongan belajar, dan lulusan sebagai wujud keterbukaan informasi publik.','crumbs' => ['Statistik' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => 'Statistik Madrasah','eyebrow' => 'Data Terbuka','subtitle' => 'Data peserta didik, pendidik, rombongan belajar, dan lulusan sebagai wujud keterbukaan informasi publik.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Statistik' => null])]); ?>
        <form class="rise rise-4 mt-8 flex items-center gap-3" method="get">
            <label for="tahun" class="text-sm text-white/70">Tahun ajaran</label>
            <select id="tahun" name="tahun" onchange="this.form.submit()" class="rounded-full border border-white/20 bg-white/10 px-4 py-2 text-sm text-white backdrop-blur [&>option]:text-ink" data-testid="statistics-year-select">
                <?php $__currentLoopData = $years; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $y): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><option value="<?php echo e($y); ?>" <?php if($y === $year): echo 'selected'; endif; ?>><?php echo e($y); ?></option><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
        </form>
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
        <div class="grid gap-px overflow-hidden rounded-2xl border border-stone-line bg-stone-line sm:grid-cols-2 lg:grid-cols-4">
            <?php $__currentLoopData = ['siswa' => 'Peserta Didik', 'guru' => 'Guru & Tendik', 'rombel' => 'Rombongan Belajar', 'lulusan' => 'Lulusan']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $g => $l): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="bg-white p-7">
                    <p class="text-sm text-ink/55"><?php echo e($l); ?></p>
                    <p class="mt-2 font-mono text-4xl font-bold text-forest" data-testid="statistics-total-<?php echo e($g); ?>"><?php echo e(number_format($sum($g), 0, ',', '.')); ?></p>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>

        <div class="mt-10 grid gap-6 lg:grid-cols-2">
            <div class="card p-7"><p class="eyebrow">Peserta didik per jenjang</p><div class="mt-6 h-72"><canvas id="chartSiswa" data-testid="chart-siswa"></canvas></div></div>
            <div class="card p-7"><p class="eyebrow">Komposisi pendidik</p><div class="mt-6 h-72"><canvas id="chartGuru" data-testid="chart-guru"></canvas></div></div>
            <div class="card p-7"><p class="eyebrow">Tren jumlah peserta didik</p><div class="mt-6 h-72"><canvas id="chartTrend" data-testid="chart-trend"></canvas></div></div>
            <div class="card p-7"><p class="eyebrow">Sebaran lulusan</p><div class="mt-6 h-72"><canvas id="chartLulusan" data-testid="chart-lulusan"></canvas></div></div>
            <div class="card p-7 lg:col-span-2"><p class="eyebrow">Prestasi berdasarkan tingkat</p><div class="mt-6 h-64"><canvas id="chartPrestasi" data-testid="chart-prestasi"></canvas></div></div>
        </div>

        <div class="mt-10 overflow-x-auto rounded-2xl border border-stone-line bg-white">
            <table class="w-full text-left text-sm" data-testid="statistics-table">
                <thead class="bg-sand text-[11px] uppercase tracking-wider text-ink/50"><tr><th class="px-6 py-3">Kelompok</th><th class="px-6 py-3">Indikator</th><th class="px-6 py-3 text-right">Jumlah</th></tr></thead>
                <tbody class="divide-y divide-stone-line">
                    <?php $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $group => $rows): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php $__currentLoopData = $rows; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <tr><td class="px-6 py-3 capitalize text-ink/60"><?php echo e($group); ?></td><td class="px-6 py-3"><?php echo e($row->label); ?></td><td class="px-6 py-3 text-right font-mono"><?php echo e(number_format($row->value, 0, ',', '.')); ?></td></tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </tbody>
            </table>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script type="module">
    const palette = ['#046A38', '#D4AF37', '#0B3C24', '#8FBF9F', '#B8962E'];
    const grid = { color: '#EFECE6' };
    const make = (id, type, labels, data, opts = {}) => new Chart(document.getElementById(id), {
        type, data: { labels, datasets: [{ data, backgroundColor: type === 'line' ? 'rgba(4,106,56,.12)' : palette, borderColor: type === 'line' ? '#046A38' : '#fff', borderWidth: type === 'line' ? 2.5 : 2, borderRadius: type === 'bar' ? 8 : 0, fill: true, tension: .35, pointBackgroundColor: '#D4AF37', pointRadius: 5 }] },
        options: Object.assign({ maintainAspectRatio: false, plugins: { legend: { display: ['doughnut', 'pie'].includes(type), position: 'bottom' } }, scales: ['doughnut', 'pie'].includes(type) ? {} : { x: { grid: { display: false } }, y: { grid, beginAtZero: true } } }, opts),
    });
    const siswa = <?php echo json_encode($siswaChart, 15, 512) ?>, guru = <?php echo json_encode($guruChart, 15, 512) ?>, lulusan = <?php echo json_encode($lulusanChart, 15, 512) ?>;
    make('chartSiswa', 'bar', siswa.labels, siswa.values);
    make('chartGuru', 'doughnut', guru.labels, guru.values, { cutout: '62%' });
    make('chartTrend', 'line', <?php echo json_encode($trend->keys(), 15, 512) ?>, <?php echo json_encode($trend->values(), 15, 512) ?>);
    make('chartLulusan', 'pie', lulusan.labels, lulusan.values);
    make('chartPrestasi', 'bar', <?php echo json_encode($levelLabels, 15, 512) ?>, <?php echo json_encode($achievementLevels->values(), 15, 512) ?>, { indexAxis: 'y' });
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/statistics.blade.php ENDPATH**/ ?>