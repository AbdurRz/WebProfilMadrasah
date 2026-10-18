@extends('layouts.public')
@section('title', $code.' — '.$heading)

@section('content')
    <section class="relative overflow-hidden bg-forest text-white grain">
        <div class="songket absolute inset-0"></div>
        <div class="container-x relative py-24 sm:py-32">
            <p class="font-mono text-7xl font-bold text-gold sm:text-8xl" data-testid="error-code">{{ $code }}</p>
            <h1 class="mt-6 max-w-2xl text-4xl leading-tight sm:text-5xl" data-testid="error-heading">{{ $heading }}</h1>
            <p class="mt-4 max-w-xl text-white/70">{{ $message }}</p>
            <div class="mt-10 flex flex-wrap gap-3">
                <a href="{{ url()->previous() !== url()->current() ? url()->previous() : route('home') }}" class="btn border border-white/25 text-white hover:bg-white hover:text-forest" data-testid="error-back-button">Kembali</a>
                <a href="{{ route('home') }}" class="btn-gold" data-testid="error-home-button">Ke beranda</a>
            </div>
        </div>
    </section>
@endsection
