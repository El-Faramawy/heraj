<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryChat extends Model
{
    use HasFactory;

    protected $guarded = [];
    protected $table = 'delivery_chat';

    public function delivery(){
        return $this->belongsTo(Delivery::class,'delivery_id');
    }
}
