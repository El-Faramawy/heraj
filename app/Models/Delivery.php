<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class Delivery extends Authenticatable implements JWTSubject
{
    use HasFactory;
    protected $hidden = [
        'password',
        'remember_token',
    ];
    protected $guarded = [];

    protected $appends = ['name','rating'];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }
    public function getJWTCustomClaims()
    {
        return [];
    }

    public function getImageAttribute(){
        return  get_file($this->attributes['image']);
    }

    public function getNameAttribute(){
        return $this->f_name.' '.$this->l_name;
    }

    public function orders(){
        return $this->hasMany(Order::class,'delivery_id');
    }

    public function chat_messages(){
        return $this->hasMany(DeliveryChat::class,'delivery_id');
    }
    public function unread_messages(){
        return $this->hasMany(DeliveryChat::class,'delivery_id')->where(['is_read'=>0,'message_from'=>'delivery']);
    }
    //===================  Rating ===========================
    public function getRatingAttribute(){
        $delivery_id = $this->id;
        $rate = Rate::whereHas('order',function ($query) use ($delivery_id){
            $query->where('delivery_id',$delivery_id);
        })->avg('delivery_rate');
        return $rate ?: 0;

    }
}
