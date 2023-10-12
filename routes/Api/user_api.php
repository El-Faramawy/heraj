<?php

use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'user', 'namespace' => 'User'], function () {

    /* ---------------------- Authentication -------------------*/
    Route::post('login','AuthController@login');
    Route::post('register', 'AuthController@register');
    Route::get('checkPhone', 'AuthController@checkPhone');

    /* ---------------------- home -------------------*/
    Route::get('home','HomeController@index');
    Route::get('product_search','HomeController@product_search');

    /* ---------------------- Category -------------------*/
    Route::get('category','CategoryController@index');
    Route::get('sub_category','CategoryController@sub_category');
    Route::get('city','CityController@index');
    Route::get('area','CityController@area');

    Route::group(['middleware' => 'all_guards:user_api'], function () {

        Route::get('profile', 'AuthController@profile');
        Route::post('update_profile', 'AuthController@update_profile');
        Route::post('verify_account','AuthController@verify_account');
        Route::post('logout', 'AuthController@logout');
        Route::post('deleteAccount', 'AuthController@deleteAccount');

        /* ---------------------- notifications -------------------*/
        Route::get('notifications', 'NotificationController@notifications');
        Route::get('getNotificationsCount', 'NotificationController@getNotificationsCount');

        /* ---------------------- product -------------------*/
        Route::group(['prefix' => 'product'], function () {
            Route::get('one_product', 'ProductController@one_product');
            Route::get('user_products', 'ProductController@user_products');
            Route::post('store', 'ProductController@store');
            Route::post('update', 'ProductController@update');
            Route::post('delete', 'ProductController@delete');
        });
        /* ---------------------- company -------------------*/
        Route::group(['prefix' => 'company'], function () {
            Route::post('store', 'CompanyController@store');
            Route::get('one_company', 'CompanyController@one_company');
            Route::get('product_search', 'CompanyController@product_search');
            Route::post('add_rate','CompanyController@add_rate');
            Route::get('followers', 'CompanyController@followers');
        });

        /* ---------------------- follow -------------------*/
        Route::post('add_delete_follow','FollowController@add_delete_follow');

        /* ---------------------- favourite -------------------*/
        Route::post('add_delete_favourite','FavouriteController@add_delete_favourite');
        Route::get('favourite_products','FavouriteController@favourite_products');

        /* ---------------------- comments -------------------*/
        Route::post('add_comment','CommentController@add_comment');
        Route::post('add_reply','CommentController@add_reply');
        Route::post('add_rate','CommentController@add_rate');

        /* ---------------------- chat -------------------*/
        Route::get('getChatRooms','ChatController@getChatRooms');
        Route::get('get_chat','ChatController@get_chat');
        Route::post('send_message','ChatController@send_message');


    });
});
