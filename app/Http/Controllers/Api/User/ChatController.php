<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Http\Traits\PaginateTrait;
use App\Http\Traits\WithRelationTrait;
use App\Models\Chat;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ChatController extends Controller
{
    use WithRelationTrait, PaginateTrait;

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

        $chat = Chat::where('product_id',$request->product_id)->first();
        $data = $request->only('message','product_id');
        $data['user_id'] = $chat ? $chat->user_id : user_api()->user()->id;
        $data['message_from'] = user_api()->id() == $data['user_id'] ? 'user' : 'seller';
        $chat = Chat::create($data);

        return $this->apiResponse($chat, '', 'simple');
    }

    /*================================================*/
    public function getChatRooms(Request $request)
    {
        $productIds = Chat::where('user_id', user_api()->user()->id)->pluck('product_id')->toArray();
        $products = Product::whereIn('id', $productIds)->select('id', 'image', 'name');
        return $this->apiResponse($products);
    }

    /*================================================*/
    public function get_chat(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $products = Chat::where(['user_id' => user_api()->user()->id, 'product_id' => $request->product_id]);
        return $this->apiResponse($products);
    }
    /*================================================*/
}
