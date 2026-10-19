<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <script>try{if(sessionStorage.getItem('splashSeen')){document.documentElement.classList.add('no-splash');}}catch(e){}</script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@hasSection('title')@yield('title') — @endif{{ $site['site_name'] ?? 'MTsN 1 Bukittinggi' }}</title>
    <meta name="description" content="@yield('description', $site['hero_subtitle'] ?? 'Website resmi MTsN 1 Bukittinggi')">
    <link rel="icon" href="{{ asset('favicon.ico') }}" sizes="any">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('favicon-32.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('favicon-16.png') }}">
    <link rel="apple-touch-icon" href="{{ asset('apple-touch-icon.png') }}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@500;700&family=Playfair+Display:ital,wght@0,500;0,600;0,700;1,500&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    @stack('head')
</head>
<body class="min-h-screen">
    @include('partials.splash')
    <a href="#main" class="sr-only focus:not-sr-only focus:fixed focus:left-4 focus:top-4 focus:z-[60] focus:rounded focus:bg-white focus:px-4 focus:py-2">Lewati ke konten</a>
    @include('partials.header')
    <main id="main">
        @yield('content')
    </main>
    @include('partials.footer')
    @stack('scripts')
</body>
</html>
