<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductReply extends Model
{
    use HasFactory;
    protected $guarded = [];
    //===================  user ===========================
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
}
