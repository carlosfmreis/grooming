<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AnimalsController;
use App\Http\Controllers\Api\OwnersController;
use App\Http\Controllers\Api\BookingsController;
use App\Http\Middleware\CheckApiPassword;

Route::middleware([CheckApiPassword::class])->group(function () {
    Route::get("/animals", [AnimalsController::class, "index"]);
    Route::post("/animals", [AnimalsController::class, "create"]);
    Route::put("/animals/{id}", [AnimalsController::class, "update"]);
    Route::delete("/animals/{id}", [AnimalsController::class, "delete"]);

    Route::get("/bookings", [BookingsController::class, "index"]);
    Route::post("/bookings", [BookingsController::class, "create"]);
    Route::put("/bookings/{id}", [BookingsController::class, "update"]);
    Route::delete("/bookings/{id}", [BookingsController::class, "delete"]);

    Route::get("/owners", [OwnersController::class, "index"]);
});
