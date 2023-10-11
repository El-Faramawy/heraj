<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\NotificationTrait;
use App\Models\Chat;
use App\Models\Delivery;
use App\Models\DeliveryChat;
use App\Models\User;
use Illuminate\Http\Request;

class DeliveryChatController extends Controller
{
    use NotificationTrait;
    public function index(Request $request){
        if ($request->id && $request->id != null){
            $one_delivery = Delivery::where('id',$request->id)->with('chat_messages')->first();
            $one_delivery->chat_messages()->update(['is_read'=>1]);
        }else{
            $one_delivery = null;
        }
        $deliverys = Delivery::withCount('chat_messages','unread_messages')->orderBy('chat_messages_count', 'desc')->get();
        return view('Admin.DeliveryChat.index',compact('deliverys','one_delivery'));
    }
    //=========================================================================
    public function send_chat(Request $request){
        $data = $request->all();
        $data['message_from'] = 'admin';
        $chat = DeliveryChat::create($data);

        event(new \App\Events\chatDelivery($chat->delivery_id,'admin',$chat->message));
        $this->sendFCMNotification([$chat->delivery_id], 'رسالة جديدة من جيتكوم', $chat->message,'delivery',null,'chat');

        return response()->json([
            'success'=>'true'
        ]);
    }
    //=========================================================================
    public function update_delivery_chat_read(Request $request){
        DeliveryChat::where('delivery_id',$request->delivery_id)->update(['is_read'=>1]);
        return response()->json();
    }
    //=========================================================================
}
