<?php

namespace App\Http\Traits;

trait WithRelationTrait
{
    /* Services */
//    private function ServiceRelations($user_id = null)
//    {
//        $ServiceWith =  [
//            'service_main_items',
//            'provider_obj',
//            'service_extra_items',
//            'service_images',
//            'offer',
//            'department',
//            /* service_rate */
//            'service_rate'=> function ($q) use ($user_id) {
//                return $q->where('user_id', $user_id);
//            },
//
//        ];
//        return $ServiceWith;
//    }

    /* ========================= products ============================*/
    /* products */
    private function productRelations()
    {
        return ['images', 'category', 'sub_category', 'area', 'city', 'user'];
    }
    /* ========================= sliders ============================*/
    /* sliders */
    private function sliderRelations()
    {
        return ['product', 'market'];
    }
    /* ========================= category ============================*/
    /* category */
    private function categoryRelations()
    {
        return ['sub_categories'];
    }
    /* ========================= city ============================*/
    /* city */
    private function cityRelations()
    {
        return ['areas'];
    }
    /* ========================= category ============================*/
    /* category */
    private function marketRelations()
    {
        return [/*'market_category.category'*/ 'market_sub_category.sub_category.products'];
    }
    /* ========================= category ============================*/
    /* category */
    private function marketAllRelations()
    {
//        return  ['market_sub_category.sub_category.products','products'/*,'products.product_additions.addition'*/];
        return ['sub_categories.products'];
    }
    /* ========================= favouriteRelations ============================*/
    /* favouriteRelations */
    private function favouriteRelations()
    {
        return ['product.user', 'product.category', 'product.sub_category', 'product.city'];
    }
    /* ========================= favouriteRelations ============================*/
    /* favouriteRelations */
    private function cartRelations()
    {
        return ['product', 'cart_additions.addition'];
    }
    /* ========================= orderRelations ============================*/
    /* order */
    private function orderRelations()
    {
        return ['order_details.product', 'order_details.additions.addition', 'coupon', 'address', 'delivery', 'user', 'market'];
    }
    /* ========================= chatRelations ============================*/
    /* chatRelations */
    private function chatRelations()
    {
        return ['user'];
    }
    /* ========================= deliveryChatRelations ============================*/
    /* chatRelations */
    private function deliveryChatRelations()
    {
        return ['delivery'];
    }


}//end class
