<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Http\Traits\NotificationTrait;
use App\Http\Traits\PaginateTrait;
use App\Http\Traits\WithRelationTrait;
use App\Models\Chat;
use App\Models\ChatRoom;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ChatController extends Controller
{
    use WithRelationTrait, PaginateTrait, NotificationTrait;

    /*================================================*/
    public function send_message(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'message' => 'required',
            'product_id' => 'required|exists:products,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }

        $product = Product::where('id', $request->product_id)->first();
        $roomCredintals = [
            'product_id'=> $product->id ,
            'buyer_id' => user_api()->user()->id ,
            'seller_id' => $product->user_id
        ];
        $chatRoom = ChatRoom::where($roomCredintals)->first();

        if (! $chatRoom){
            $chatRoom = ChatRoom::create($roomCredintals);
        }

        $data = $request->only('message');
        $data['message_from'] = user_api()->id() == $chatRoom->buyer_id ? 'buyer' : 'seller';
        $data['room_id'] = $chatRoom->id;
        $chat = Chat::create($data);

        $user_id = $chat->message_from == 'buyer' ? $chatRoom->seller_id : $chatRoom->buyer_id;
        $msg_data = ['Room'=>$chatRoom,'message'=>$chat];
        $this->sendFCMNotification([$user_id], 'سالة جديدة', $chat->message , $msg_data , 'chat');

        return $this->apiResponse($chat, '', 'simple');
    }

    /*================================================*/
    public function getChatRooms(Request $request)
    {
        $data = ChatRoom::with('product')
            ->where('seller_id' , user_api()->id())
            ->orwhere('buyer_id' , user_api()->id());

        return $this->apiResponse($data);
    }

    /*================================================*/
    public function get_chat(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'room_id' => 'required|exists:chat_rooms,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $products = Chat::where('room_id',$request->room_id);
        return $this->apiResponse($products);
    }
    /*================================================*/
}
