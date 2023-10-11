<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\NotificationTrait;
use App\Models\Chat;
use App\Models\User;
use Illuminate\Http\Request;

class ChatController extends Controller
{
    use NotificationTrait;
    public function index(Request $request){
        if ($request->id && $request->id != null){
            $one_user = User::where('id',$request->id)->with('chat_messages')->first();
            $one_user->chat_messages()->update(['is_read'=>1]);
        }else{
            $one_user = null;
        }
        $users = User::withCount('chat_messages','unread_messages')->orderBy('chat_messages_count', 'desc')->get();
        return view('Admin.Chat.index',compact('users','one_user'));
    }
    //=========================================================================
    public function send_chat(Request $request){
        $data = $request->all();
        $data['message_from'] = 'admin';
        $chat = Chat::create($data);

        event(new \App\Events\chatUser($chat->user_id,'admin',$chat->message));

        $this->sendFCMNotification([$chat->user_id], 'رسالة جديدة من جيتكوم', $chat->message,'user',null,'chat');

        return response()->json([
//            'message'=>'sent successfully',
            'success'=>'true'
        ]);
    }
    //=========================================================================
    public function update_user_chat_read(Request $request){
        Chat::where('user_id',$request->user_id)->update(['is_read'=>1]);
        return response()->json();
    }
    //=========================================================================
}
