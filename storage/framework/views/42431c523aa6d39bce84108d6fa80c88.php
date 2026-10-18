<?php $__env->startSection('title', ($item->exists ? 'Ubah ' : 'Tambah ').$singular); ?>

<?php $__env->startSection('content'); ?>
    <form method="post" enctype="multipart/form-data" action="<?php echo e($item->exists ? route("admin.$route.update", $item->id) : route("admin.$route.store")); ?>" class="grid gap-6 xl:grid-cols-3" data-testid="crud-form">
        <?php echo csrf_field(); ?>
        <?php if($item->exists): ?> <?php echo method_field('PUT'); ?> <?php endif; ?>

        <div class="card space-y-6 p-6 sm:p-8 xl:col-span-2">
            <?php $__currentLoopData = $fields; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $name => $f): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if($f['type'] === 'hidden') continue; ?>
                <?php
                    $raw = old($name, $item->{$name} ?? null);
                    $value = match ($f['type']) {
                        'date' => $raw instanceof \Carbon\CarbonInterface ? $raw->format('Y-m-d') : $raw,
                        'datetime' => $raw instanceof \Carbon\CarbonInterface ? $raw->format('Y-m-d\TH:i') : $raw,
                        'password' => '',
                        default => $raw,
                    };
                    $id = 'field-'.$name;
                    $tid = 'input-'.Str::slug($name);
                ?>
                <div>
                    <?php if($f['type'] === 'checkbox'): ?>
                        <label class="flex items-center gap-3 text-sm font-medium">
                            <input type="hidden" name="<?php echo e($name); ?>" value="0">
                            <input type="checkbox" name="<?php echo e($name); ?>" value="1" <?php if($item->exists ? $raw : old($name, $f['default'] ?? false)): echo 'checked'; endif; ?> class="h-4 w-4 accent-emerald-brand" data-testid="<?php echo e($tid); ?>">
                            <?php echo e($f['label']); ?>

                        </label>
                    <?php else: ?>
                        <label for="<?php echo e($id); ?>" class="field-label"><?php echo e($f['label']); ?> <?php if(Str::contains(is_array($f['rules'] ?? '') ? implode('|', $f['rules']) : ($f['rules'] ?? ''), 'required')): ?><span class="text-red-600">*</span><?php endif; ?></label>
                        <?php switch($f['type']):
                            case ('textarea'): ?>
                                <textarea id="<?php echo e($id); ?>" name="<?php echo e($name); ?>" rows="4" class="field-input" data-testid="<?php echo e($tid); ?>"><?php echo e($value); ?></textarea>
                                <?php break; ?>
                            <?php case ('richtext'): ?>
                                <input id="<?php echo e($id); ?>" type="hidden" name="<?php echo e($name); ?>" value="<?php echo e($value); ?>">
                                <trix-editor input="<?php echo e($id); ?>" class="trix-content" data-testid="<?php echo e($tid); ?>"></trix-editor>
                                <?php break; ?>
                            <?php case ('select'): ?>
                                <select id="<?php echo e($id); ?>" name="<?php echo e($name); ?>" class="field-input" data-testid="<?php echo e($tid); ?>">
                                    <option value="">— Pilih —</option>
                                    <?php $__currentLoopData = $f['options']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $l): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><option value="<?php echo e($k); ?>" <?php if((string) $value === (string) $k): echo 'selected'; endif; ?>><?php echo e($l); ?></option><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                                <?php break; ?>
                            <?php case ('image'): ?>
                            <?php case ('file'): ?>
                                <div class="flex items-center gap-4">
                                    <?php if($item->{$name}): ?>
                                        <?php if($f['type'] === 'image'): ?><img src="<?php echo e(\App\Support\Media::url($item->{$name})); ?>" alt="" class="h-16 w-24 rounded-lg object-cover" data-testid="<?php echo e($tid); ?>-preview"><?php else: ?><a href="<?php echo e(\App\Support\Media::url($item->{$name})); ?>" target="_blank" class="text-xs text-emerald-brand underline">Berkas saat ini</a><?php endif; ?>
                                    <?php endif; ?>
                                    <input id="<?php echo e($id); ?>" type="file" name="<?php echo e($name); ?>" <?php if($f['type'] === 'image'): ?> accept="image/*" <?php endif; ?> class="block w-full text-sm file:mr-4 file:rounded-full file:border-0 file:bg-sand-dark file:px-4 file:py-2 file:text-sm file:font-medium" data-testid="<?php echo e($tid); ?>">
                                </div>
                                <?php break; ?>
                            <?php case ('images'): ?>
                                <input id="<?php echo e($id); ?>" type="file" name="<?php echo e($name); ?>[]" multiple accept="image/*" class="block w-full text-sm file:mr-4 file:rounded-full file:border-0 file:bg-sand-dark file:px-4 file:py-2 file:text-sm file:font-medium" data-testid="<?php echo e($tid); ?>">
                                <?php break; ?>
                            <?php default: ?>
                                <input id="<?php echo e($id); ?>" type="<?php echo e($f['type'] === 'datetime' ? 'datetime-local' : $f['type']); ?>" name="<?php echo e($name); ?>" value="<?php echo e($value); ?>" class="field-input" data-testid="<?php echo e($tid); ?>">
                        <?php endswitch; ?>
                    <?php endif; ?>
                    <?php if(! empty($f['help'])): ?><p class="mt-1.5 text-xs text-ink/50"><?php echo e($f['help']); ?></p><?php endif; ?>
                    <?php $__errorArgs = [$name];
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

        <div class="space-y-6">
            <div class="card sticky top-24 p-6">
                <p class="font-medium text-forest">Simpan perubahan</p>
                <p class="mt-1 text-sm text-ink/55">Pastikan data sudah benar sebelum disimpan.</p>
                <div class="mt-5 flex gap-2">
                    <button class="btn-primary flex-1" data-testid="crud-submit-button">Simpan</button>
                    <a href="<?php echo e(route("admin.$route.index")); ?>" class="btn-ghost" data-testid="crud-cancel-button">Batal</a>
                </div>
                <?php $publicRoute = ['posts' => 'news.show', 'announcements' => 'announcements.show', 'galleries' => 'galleries.show'][$route] ?? null; ?>
                <?php if($item->exists && $publicRoute): ?>
                    <a href="<?php echo e(route($publicRoute, $item)); ?>" target="_blank" class="mt-4 block text-center text-xs text-emerald-brand" data-testid="crud-view-public-link">Lihat di website ↗</a>
                <?php endif; ?>
            </div>

            <?php if($route === 'galleries' && $item->exists && $item->items->isNotEmpty()): ?>
                <div class="card p-6" data-testid="gallery-items-panel">
                    <p class="mb-4 font-medium text-forest">Foto dalam album (<?php echo e($item->items->count()); ?>)</p>
                    <div class="grid grid-cols-3 gap-2">
                        <?php $__currentLoopData = $item->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $photo): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="group relative">
                                <img src="<?php echo e($photo->url); ?>" alt="" class="aspect-square w-full rounded-lg object-cover">
                                <button form="del-photo-<?php echo e($photo->id); ?>" class="absolute right-1 top-1 h-6 w-6 rounded-full bg-red-600 text-xs text-white lg:hidden lg:group-hover:block" data-testid="gallery-item-delete-<?php echo e($photo->id); ?>">✕</button>
                            </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </div>
            <?php endif; ?>
        </div>
    </form>

    <?php if($route === 'galleries' && $item->exists): ?>
        <?php $__currentLoopData = $item->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $photo): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <form id="del-photo-<?php echo e($photo->id); ?>" method="post" action="<?php echo e(route('admin.gallery-items.destroy', $photo)); ?>" onsubmit="return confirm('Hapus foto ini?')"><?php echo csrf_field(); ?> <?php echo method_field('DELETE'); ?></form>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    <?php endif; ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/admin/crud/form.blade.php ENDPATH**/ ?>