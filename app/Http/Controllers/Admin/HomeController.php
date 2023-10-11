<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Contact;
use App\Models\Delivery;
use App\Models\Market;
use App\Models\Order;
use App\Models\Part;
use App\Models\Slider;
use App\Models\SubCategory;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{

    public function index(Request $request){

        $created_from = $request->created_from ? date('Y-m-d',strtotime($request->created_from)):date('2023-1-1');
        $created_to = $request->created_to ?date('Y-m-d' ,strtotime($request->created_to)):date('Y-m-d' );
//
        $chart_day_array = $chart_order_array = [];
        $chart_order_count = 0;

        for($i= 9 ; $i>=0 ; $i--){
            array_push($chart_day_array , (string)date('d/m',strtotime('-'.$i.'day') ) );
            $order = Order::where(['status'=>'ended'])->whereDate('created_at' , date('Y-m-d',strtotime('-'.$i.'day') ))->count();
            $chart_order_count += $order;
            array_push($chart_order_array , (string)$order );
        }
        $total_income = Order::where(['status'=>'ended'])->whereBetween('created_at',[date('Y-m-d',strtotime('-10day')  ),date('Y-m-d',strtotime('+1day') )])->count();
////        return $chart_order_array;
////        //*************** end target clients chart ******************
//
        $order_count = Order::whereBetween('created_at',[$created_from,$created_to])->count();
        $user_count = User::whereBetween('created_at',[$created_from,$created_to])->count();
        $admin_count = Admin::whereBetween('created_at',[$created_from,$created_to])->count();
        $delivery_count = Delivery::whereBetween('created_at',[$created_from,$created_to])->count();
        $market_count = Market::whereBetween('created_at',[$created_from,$created_to])->count();
        $contact_count = Contact::whereBetween('created_at',[$created_from,$created_to])->count();
        $category_count = Category::whereBetween('created_at',[$created_from,$created_to])->count();
        $slider_count = Slider::whereBetween('created_at',[$created_from,$created_to])->count();
//
        $new_order_count = Order::whereBetween('created_at',[$created_from,$created_to])->where('status','new')->count();
        $ended_order_count = Order::whereBetween('created_at',[$created_from,$created_to])->where('status','ended')->count();
        $accepted_order_count = Order::whereBetween('created_at',[$created_from,$created_to])->where('status','accepted')->count();
        $refused_order_count = Order::whereBetween('created_at',[$created_from,$created_to])->where('status','refused')->count();
        $delivery_order_count = Order::whereBetween('created_at',[$created_from,$created_to])->where('status','delivery')->count();
        $canceled_order_count = Order::whereBetween('created_at',[$created_from,$created_to])->where('status','canceled')->count();
        $marker_order_count = Order::whereBetween('created_at',[$created_from,$created_to])
            ->whereIn('status',['in_market_way','wait_order'])->count();
//
//        //****************************************************************
//        $most_sell_parts = Part::whereHas('order_details',function ($query){
//            $query->whereHas('order',function ($query2){
//                $query2->where('status','ended');
//            });
//        })->withCount('order_details')->orderBy('order_details_count','desc')->take(10)->get();
//
        $most_purchase_clients = User::whereHas('orders',function ($query){
            $query->where('status','ended');
        })->withCount('orders')->orderBy('orders_count','desc')->take(10)->get();
//
        return view('Admin.index',['created_from'=>$created_from,'created_to'=>$created_to],
            compact( 'order_count','user_count','admin_count','contact_count',
            'delivery_count','market_count','category_count','slider_count','total_income',
            'chart_day_array','chart_order_array','chart_order_count','most_purchase_clients',
            'new_order_count','ended_order_count','accepted_order_count','refused_order_count',
            'delivery_order_count','marker_order_count','canceled_order_count'
            ));
//        return view('Admin.index');
    }

    //###################################################


}
