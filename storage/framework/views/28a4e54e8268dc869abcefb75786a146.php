<?php $__env->startSection('title', 'PPDB '.$year); ?>

<?php
    $input = fn ($name, $label, $type = 'text', $attrs = '') => compact('name', 'label', 'type', 'attrs');
?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => 'Penerimaan Peserta Didik Baru '.$year,'eyebrow' => 'PPDB','subtitle' => 'Informasi persyaratan, jadwal, dan pendaftaran online calon peserta didik MTsN 1 Bukittinggi.','crumbs' => ['PPDB' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute('Penerimaan Peserta Didik Baru '.$year),'eyebrow' => 'PPDB','subtitle' => 'Informasi persyaratan, jadwal, dan pendaftaran online calon peserta didik MTsN 1 Bukittinggi.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['PPDB' => null])]); ?>
        <div class="rise rise-4 mt-8 flex flex-wrap items-center gap-3">
            <span class="inline-flex items-center gap-2 rounded-full px-4 py-1.5 text-sm font-semibold <?php echo e($open ? 'bg-gold text-forest' : 'bg-white/10 text-white/80'); ?>" data-testid="ppdb-status-badge">
                <span class="h-2 w-2 rounded-full <?php echo e($open ? 'bg-forest animate-pulse' : 'bg-white/50'); ?>"></span>
                Pendaftaran <?php echo e($open ? 'dibuka' : 'ditutup'); ?>

            </span>
            <?php if($quota): ?><span class="rounded-full border border-white/20 px-4 py-1.5 text-sm text-white/80">Kuota <span class="font-mono text-white"><?php echo e($quota); ?></span> siswa · <span class="font-mono text-white" data-testid="ppdb-registered-count"><?php echo e($registered); ?></span> pendaftar</span><?php endif; ?>
            <a href="<?php echo e(route('ppdb.check')); ?>" class="rounded-full border border-white/20 px-4 py-1.5 text-sm text-white hover:border-gold hover:text-gold" data-testid="ppdb-check-link">Cek status pendaftaran →</a>
        </div>
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

    <div class="container-x grid gap-10 py-16 lg:grid-cols-12">
        <div class="space-y-10 lg:col-span-5">
            <?php if($p = $pages->get('ppdb_alur')): ?>
                <section data-testid="ppdb-flow">
                    <p class="eyebrow"><?php echo e($p->title); ?></p>
                    <div class="prose-madrasah mt-5"><?php echo $p->content; ?></div>
                </section>
            <?php endif; ?>
            <?php if($p = $pages->get('ppdb_persyaratan')): ?>
                <section class="card p-7" data-testid="ppdb-requirements">
                    <h2 class="text-2xl text-forest"><?php echo e($p->title); ?></h2>
                    <div class="prose-madrasah mt-4"><?php echo $p->content; ?></div>
                </section>
            <?php endif; ?>
            <?php if($p = $pages->get('ppdb_jadwal')): ?>
                <section class="relative overflow-hidden rounded-2xl bg-forest p-7 text-white grain" data-testid="ppdb-schedule">
                    <div class="songket absolute inset-0 opacity-50"></div>
                    <h2 class="relative text-2xl"><?php echo e($p->title); ?></h2>
                    <div class="relative mt-5 text-sm leading-7 text-white/80 [&_li]:border-b [&_li]:border-white/10 [&_li]:py-2.5 [&_strong]:text-gold [&_ul]:space-y-0"><?php echo $p->content; ?></div>
                </section>
            <?php endif; ?>
        </div>

        <div class="scroll-mt-28 lg:col-span-7" id="formulir" <?php if($errors->any()): ?> x-data x-init="$el.scrollIntoView({ behavior: 'smooth' })" <?php endif; ?>>
            <?php if($open): ?>
                <form method="post" action="<?php echo e(route('ppdb.store')); ?>" enctype="multipart/form-data" class="card p-6 sm:p-10" data-testid="ppdb-form" x-data="{ sending: false }" @submit="sending = true">
                    <?php echo csrf_field(); ?>
                    <input type="text" name="website" tabindex="-1" autocomplete="off" class="hidden" aria-hidden="true">
                    <h2 class="text-3xl text-forest">Formulir pendaftaran online</h2>
                    <p class="mt-2 text-sm text-ink/60">Isi data sesuai dokumen resmi. Kolom bertanda <span class="text-red-600">*</span> wajib diisi.</p>

                    <?php if($errors->any()): ?>
                        <div class="mt-6 rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700" data-testid="ppdb-form-errors">
                            <p class="font-medium">Periksa kembali isian berikut:</p>
                            <ul class="mt-1 list-inside list-disc"><?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $e): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><li><?php echo e($e); ?></li><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?></ul>
                        </div>
                    <?php endif; ?>

                    <?php $__currentLoopData = [
                        'Data calon peserta didik' => [
                            $input('full_name', 'Nama lengkap'), $input('nisn', 'NISN (10 digit)', 'text', 'inputmode=numeric maxlength=10'),
                            $input('gender', 'Jenis kelamin', 'gender'), $input('birth_place', 'Tempat lahir'),
                            $input('birth_date', 'Tanggal lahir', 'date'), $input('previous_school', 'Asal sekolah (SD/MI)'),
                            $input('address', 'Alamat lengkap', 'textarea'),
                        ],
                        'Data orang tua / wali' => [
                            $input('parent_name', 'Nama orang tua/wali'), $input('parent_phone', 'No. HP / WhatsApp', 'tel', 'placeholder=081234567890'),
                            $input('email', 'Email (opsional)', 'email'), $input('achievement_note', 'Prestasi yang pernah diraih (opsional)', 'textarea'),
                        ],
                        'Unggah berkas' => [
                            $input('doc_kk', 'Kartu Keluarga (PDF/JPG, maks. 2 MB)', 'file'), $input('doc_rapor', 'Rapor kelas 4–5 SD/MI (PDF/JPG, maks. 2 MB)', 'file'),
                        ],
                    ]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $section => $fields): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <fieldset class="mt-10">
                            <legend class="mb-5 flex items-center gap-3 text-[11px] font-semibold uppercase tracking-[0.2em] text-emerald-brand"><span class="grid h-6 w-6 place-items-center rounded-full bg-gold font-mono text-[11px] text-forest"><?php echo e($loop->iteration); ?></span><?php echo e($section); ?></legend>
                            <div class="grid gap-5 sm:grid-cols-2">
                                <?php $__currentLoopData = $fields; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $f): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php $optional = str_contains($f['label'], 'opsional'); $tid = 'ppdb-input-'.Str::slug($f['name']); ?>
                                    <div class="<?php echo e(in_array($f['type'], ['textarea', 'file']) ? 'sm:col-span-2' : ''); ?>">
                                        <label for="<?php echo e($f['name']); ?>" class="field-label"><?php echo e($f['label']); ?> <?php if (! ($optional)): ?><span class="text-red-600">*</span><?php endif; ?></label>
                                        <?php switch($f['type']):
                                            case ('textarea'): ?>
                                                <textarea id="<?php echo e($f['name']); ?>" name="<?php echo e($f['name']); ?>" rows="3" class="field-input" data-testid="<?php echo e($tid); ?>"><?php echo e(old($f['name'])); ?></textarea>
                                                <?php break; ?>
                                            <?php case ('gender'): ?>
                                                <div class="grid grid-cols-2 gap-2">
                                                    <?php $__currentLoopData = ['L' => 'Laki-laki', 'P' => 'Perempuan']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $gv => $gl): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <label class="cursor-pointer"><input type="radio" name="gender" value="<?php echo e($gv); ?>" class="peer sr-only" <?php if(old('gender') === $gv): echo 'checked'; endif; ?> data-testid="ppdb-gender-<?php echo e($gv); ?>"><span class="block rounded-lg border border-stone-line px-3 py-2.5 text-center text-sm transition-colors peer-checked:border-emerald-brand peer-checked:bg-emerald-brand peer-checked:text-white"><?php echo e($gl); ?></span></label>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </div>
                                                <?php break; ?>
                                            <?php case ('file'): ?>
                                                <input id="<?php echo e($f['name']); ?>" type="file" name="<?php echo e($f['name']); ?>" accept=".pdf,.jpg,.jpeg,.png" class="block w-full rounded-lg border border-dashed border-stone-line bg-sand/50 p-3 text-sm file:mr-4 file:rounded-full file:border-0 file:bg-forest file:px-4 file:py-2 file:text-sm file:font-medium file:text-white" data-testid="<?php echo e($tid); ?>">
                                                <?php break; ?>
                                            <?php default: ?>
                                                <input id="<?php echo e($f['name']); ?>" type="<?php echo e($f['type']); ?>" name="<?php echo e($f['name']); ?>" value="<?php echo e(old($f['name'])); ?>" <?php echo $f['attrs']; ?> class="field-input" data-testid="<?php echo e($tid); ?>">
                                        <?php endswitch; ?>
                                        <?php $__errorArgs = [$f['name']];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?><p class="mt-1.5 text-xs text-red-600" data-testid="<?php echo e($tid); ?>-error"><?php echo e($message); ?></p><?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </fieldset>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                    <label class="mt-10 flex items-start gap-3 rounded-xl bg-sand p-4 text-sm text-ink/75">
                        <input type="checkbox" name="agree" value="1" class="mt-0.5 h-4 w-4 accent-emerald-brand" <?php if(old('agree')): echo 'checked'; endif; ?> data-testid="ppdb-agree-checkbox">
                        Saya menyatakan bahwa data yang saya isi adalah benar dan dapat dipertanggungjawabkan.
                    </label>
                    <button class="btn-primary mt-6 w-full py-3.5 text-base disabled:opacity-60" :disabled="sending" data-testid="ppdb-submit-button"><span x-text="sending ? 'Mengirim…' : 'Kirim pendaftaran'">Kirim pendaftaran</span></button>
                </form>
            <?php else: ?>
                <div class="card p-10 text-center" data-testid="ppdb-closed-notice">
                    <p class="font-serif text-3xl text-forest">Pendaftaran online sedang ditutup</p>
                    <p class="mx-auto mt-3 max-w-md text-sm text-ink/60">Pantau halaman pengumuman untuk jadwal pembukaan berikutnya, atau hubungi panitia PPDB di <?php echo e($site['phone'] ?? ''); ?>.</p>
                    <a href="<?php echo e(route('announcements.index')); ?>" class="btn-ghost mt-6">Lihat pengumuman</a>
                </div>
            <?php endif; ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/ppdb/index.blade.php ENDPATH**/ ?>