<?php

namespace App\Http\Controllers\Api\Guest;

use App\Http\Controllers\Controller;
use App\Http\Traits\OpenOrClosed;
use App\Models\Category;
use App\Models\Notification;
use App\Models\Offer;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\Product;
use App\Models\Slider;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    use OpenOrClosed;

    public function index(){
        $data = [];
        $data['sliders'] = Slider::with('product', 'offer')->get();
        $data['categories'] = Category::with('products')->whereHas('products')->get();
        $data['most_sell_products'] = Product::whereHas('order_details')->withCount('order_details')->orderBy('order_details_count','desc')->take(12)->get();
        $open_or_closed = $this->openOrClosed(date('H:i:s' ,strtotime('+1hours') ));
        $data['open_or_closed'] = $open_or_closed['status'] ;
        $data['day'] = $open_or_closed['day'] ;
        $data['open_time'] = $open_or_closed['open_time'] ;
        $data['close_time'] = $open_or_closed['close_time'] ;
//        $data['notification_count'] = Notification::where('user_id',user_api()->user()->id)->where('is_read',false)->count();
//        $data['order_count'] = Order::where('user_id',user_api()->user()->id)->whereIn('status',['new','accepted','preparing','delivery'])->count();

        return apiResponse($data);
    }
    //================================================================

    public function product_search(Request $request){
       $data = Product::where('name_it','like','%' .$request->name. '%')
           ->orWhere('name_ge','like','%' .$request->name. '%')
           ->orWhere('name_fr','like','%' .$request->name. '%')
           ->get();
        return apiResponse($data);
    }
    //================================================================
}
