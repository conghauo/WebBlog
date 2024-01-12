<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ImageController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\UserTimeController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::middleware(['flarum'])->group(function () {
Route::post('image',[ImageController::class, 'imageStore']);
Route::post('delete-image',[ImageController::class, 'removeImage']);
Route::get('getUser',[UserController::class, 'returnUser']);
Route::get('getCredits',[UserTimeController::class, 'getTimeCurrentUser']);
});
Route::post('updateCredits',[ImageController::class, 'updateCredit']);

