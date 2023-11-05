<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChatRoom extends Model
{
    use HasFactory;

    protected $guarded = [];
    protected $table = 'chat_rooms';

    public function user(){
        return $this->belongsTo(User::class );
    }
    public function product(){
        return $this->belongsTo(Product::class , 'product_id');
    }
}
