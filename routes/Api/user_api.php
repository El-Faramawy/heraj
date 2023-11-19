<?php

use Illuminate\Support\Facades\Route;


Route::group(['prefix' => 'user', 'namespace' => 'User'], function () {

    /* ---------------------- Authentication -------------------*/
    Route::post('login','AuthController@login');
    Route::post('register', 'AuthController@register');

    Route::get('checkPhone', 'ForgetPasswordController@checkPhone');
    Route::post('update_password', 'ForgetPasswordController@update_password');

//    /* ---------------------- home -------------------*/
//    Route::get('home','HomeController@index');
//    Route::get('product_search','HomeController@product_search');


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

        /* ---------------------- home -------------------*/
        Route::get('home','HomeController@index');
        Route::get('product_search','HomeController@product_search');

        /* ---------------------- notifications -------------------*/
        Route::get('notifications', 'NotificationController@notifications');
        Route::get('getNotificationsCount', 'NotificationController@getNotificationsCount');

        /* ---------------------- product -------------------*/
        Route::group(['prefix' => 'product'], function () {
            Route::get('one_product', 'ProductController@one_product');
            Route::get('user_products', 'ProductController@user_products');
            Route::post('store', 'ProductController@store');
            Route::post('update/{id}', 'ProductController@update');
            Route::post('delete', 'ProductController@delete');
            Route::get('rates', 'ProductController@rates');
        });
        /* ---------------------- company -------------------*/
        Route::group(['prefix' => 'company'], function () {
            Route::post('store', 'CompanyController@store');
            Route::get('one_company', 'CompanyController@one_company');
            Route::get('product_search', 'CompanyController@product_search');
            Route::post('add_rate','CompanyController@add_rate');
            Route::get('followers', 'CompanyController@followers');
            Route::get('users_i_follow', 'CompanyController@users_i_follow');
            Route::get('rates', 'CompanyController@rates');
        });
        /* ---------------------- packages -------------------*/
        Route::group(['prefix' => 'packages'], function () {
            Route::get('/', 'PackageController@packages');
            Route::post('store', 'PackageController@store');
            Route::post('addPannerAd', 'PackageController@addPannerAd');
            Route::post('deletePannerAd', 'PackageController@deletePannerAd');
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
