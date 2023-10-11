<?php

use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'guest', 'namespace' => 'User'], function () {

    /* ---------------------- home -------------------*/
    Route::get('home','HomeController@index');
    Route::get('product_search','HomeController@product_search');
    /* ---------------------- product -------------------*/
    Route::group(['prefix' => 'product'], function () {
        Route::get('one_product', 'ProductController@one_product');
    });

});
