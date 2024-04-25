<?php

use App\Http\Controllers\BodyTypeController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\CountryController;
use App\Http\Controllers\EngineController;
use App\Http\Controllers\FuelTypeController;
use App\Http\Controllers\MarqueController;
use App\Http\Controllers\ModelController;
use App\Http\Controllers\StateController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\CarController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::post('/login', [LoginController::class, 'login']);

Route::post('/register', [RegisterController::class, 'register']);

Route::middleware('auth:sanctum')->post('/logout', [LoginController::class,
'logout']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('api')->group(function () {
    Route::resource('marques', MarqueController::class);
});

Route::middleware('api')->group(function () {
    Route::resource('models',ModelController::class);
});

Route::middleware('api')->group(function () {
    Route::resource('bodytypes',BodyTypeController::class);
});
Route::middleware('api')->group(function () {
    Route::resource('fueltypes',FuelTypeController::class);
});
Route::middleware('api')->group(function () {
    Route::resource('countries',CountryController::class);
});
Route::middleware('api')->group(function () {
    Route::resource('states',StateController::class);
});
Route::middleware('api')->group(function () {
    Route::resource('engines',EngineController::class);
});
Route::middleware('api')->group(function () {
    Route::resource('contacts',ContactController::class);
});

Route::middleware('api')->group(function () {
    Route::resource('cars',CarController::class);
});

Route::middleware('api')->group(function () {
    Route::post('/filtercars', [CarController::class, 'filterlistcars'])->name('filtercars');
});

Route::middleware('api')->group(function () {
    Route::get('/getusercars/{id}', [CarController::class, 'getusercars'])->name('getusercars');
});

