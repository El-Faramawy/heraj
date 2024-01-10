<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductComment extends Model
{
    use HasFactory;
    protected $guarded = [];
    //===================  replies ===========================
    public function replies()
    {
        return $this->hasMany(ProductReply::class,'comment_id');
    }
    //===================  user ===========================
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
    //===================  product ===========================
    public function product()
    {
        return $this->belongsTo(Product::class,'product_id');
    }
}
