<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
// use App\Events\MyEvent;
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

/* ---------------------- Auth -------------------*/
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

/* ---------------------- setting -------------------*/
Route::get('setting','SettingController@setting');




require __DIR__ . '/Api/user_api.php';
require __DIR__ . '/Api/guest_api.php';



