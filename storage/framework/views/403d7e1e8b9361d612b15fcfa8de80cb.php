<?php $attributes ??= new \Illuminate\View\ComponentAttributeBag;

$__newAttributes = [];
$__propNames = \Illuminate\View\ComponentAttributeBag::extractPropNames((['priority']));

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

foreach (array_filter((['priority']), 'is_string', ARRAY_FILTER_USE_KEY) as $__key => $__value) {
    $$__key = $$__key ?? $__value;
}

$__defined_vars = get_defined_vars();

foreach ($attributes->all() as $__key => $__value) {
    if (array_key_exists($__key, $__defined_vars)) unset($$__key);
}

unset($__defined_vars, $__key, $__value); ?>
<?php
    $map = ['mendesak' => 'bg-red-50 text-red-700 ring-red-200', 'penting' => 'bg-amber-50 text-amber-800 ring-amber-200', 'normal' => 'bg-emerald-50 text-emerald-800 ring-emerald-200'];
?>
<span <?php echo e($attributes->merge(['class' => 'inline-flex items-center rounded-full px-2.5 py-0.5 text-[11px] font-semibold uppercase tracking-wide ring-1 '.($map[$priority] ?? $map['normal'])])); ?>><?php echo e(ucfirst($priority)); ?></span>
<?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/components/priority-badge.blade.php ENDPATH**/ ?>