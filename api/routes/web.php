<?php

use Illuminate\Support\Facades\Route;

Route::get("/", function () {
    return view("welcome");
});

Route::get('/php-info', function() {
    return response()->json([
        'upload_max' => ini_get('upload_max_filesize'),
        'post_max' => ini_get('post_max_size'),
        'ini_path' => php_ini_loaded_file()
    ]);
});
