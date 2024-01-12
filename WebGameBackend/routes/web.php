<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::middleware(['flarum'])->group(function () {
Route::get('/welcome', function () {
    return view('welcome');
});
Route::get('/game1', function () {
    return view('Game1');
});
Route::get('/game2', function () {
    return view('Game2');
});
Route::get('/payment', function () {
    return view('PayPage');
});
Route::middleware(['admin'])->group(function () {
Route::get('/game-admin', function () {
    return view('admin_page.index');
})->name('game-admin');
Route::get('/game-admin/game1', function () {
    return view('admin_page.page.game1');
})->name('admin-game1');
Route::get('/game-admin/game2', function () {
    return view('admin_page.page.game2');
})->name('admin-game2');
Route::get('/game-admin/payments', function () {
    return view('admin_page.page.payments');
})->name('admin-payments');
});

});
