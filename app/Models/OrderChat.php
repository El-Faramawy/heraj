<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderChat extends Model
{
    use HasFactory;

    protected $guarded = [];
    protected $table = 'order_chat';

    public function order(){
        return $this->belongsTo(Order::class);
    }
}
