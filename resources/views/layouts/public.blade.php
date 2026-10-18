<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@hasSection('title')@yield('title') — @endif{{ $site['site_name'] ?? 'MTsN 1 Bukittinggi' }}</title>
    <meta name="description" content="@yield('description', $site['hero_subtitle'] ?? 'Website resmi MTsN 1 Bukittinggi')">
    <link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 40 40'%3E%3Crect width='40' height='40' rx='10' fill='%23046A38'/%3E%3Cpath d='M20 6 34 20 20 34 6 20Z' fill='none' stroke='%23D4AF37' stroke-width='2.5'/%3E%3C/svg%3E">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@500;700&family=Playfair+Display:ital,wght@0,500;0,600;0,700;1,500&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    @stack('head')
</head>
<body class="min-h-screen">
    <a href="#main" class="sr-only focus:not-sr-only focus:fixed focus:left-4 focus:top-4 focus:z-[60] focus:rounded focus:bg-white focus:px-4 focus:py-2">Lewati ke konten</a>
    @include('partials.header')
    <main id="main">
        @yield('content')
    </main>
    @include('partials.footer')
    @stack('scripts')
</body>
</html>
