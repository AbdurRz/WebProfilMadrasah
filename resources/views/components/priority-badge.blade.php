@props(['priority'])
@php
    $map = ['mendesak' => 'bg-red-50 text-red-700 ring-red-200', 'penting' => 'bg-amber-50 text-amber-800 ring-amber-200', 'normal' => 'bg-emerald-50 text-emerald-800 ring-emerald-200'];
@endphp
<span {{ $attributes->merge(['class' => 'inline-flex items-center rounded-full px-2.5 py-0.5 text-[11px] font-semibold uppercase tracking-wide ring-1 '.($map[$priority] ?? $map['normal'])]) }}>{{ ucfirst($priority) }}</span>
