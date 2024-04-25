<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cars</title>
    <link rel="stylesheet" href="{{asset('assets/vendor/simplebar/dist/simplebar.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/vendor/nouislider/dist/nouislider.min.css')}}" >
    <link rel="stylesheet" href="{{ asset('assets/vendor/tiny-slider/dist/tiny-slider.css') }}">

    <!-- Main Theme Styles + Bootstrap-->

    <link rel="stylesheet" href="{{asset('assets/vendor/lightgallery/css/lightgallery-bundle.min.css')}}" >
    <link rel="stylesheet" href="{{asset('assets/vendor/flatpickr/dist/flatpickr.min.css')}}"  >
    <link rel="stylesheet" href="{{asset('assets/css/theme.min.css')}}" >
</head>
<body>
<div id="app"></div>
@vite('resources/js/app.js')
<script src="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.9.3/min/tiny-slider.js"></script>
<script src="{{asset('assets/vendor/tiny-slider/dist/min/tiny-slider.js')}}"></script>
<script src="{{asset('assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js')}}"></script>
<script src="{{asset('assets/vendor/simplebar/dist/simplebar.min.js')}}"></script>
<script src="{{asset('assets/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js')}}"></script>
<script src="{{asset('assets/vendor/nouislider/dist/nouislider.min.js')}}"></script>
<script src="{{asset('assets/vendor/lightgallery/lightgallery.min.js')}}"></script>
<script src="{{asset('assets/vendor/lightgallery/plugins/video/lg-video.min.js')}}"></script>
<script src="{{asset('assets/js/theme.min.js')}}"></script>
</body>
</html>
