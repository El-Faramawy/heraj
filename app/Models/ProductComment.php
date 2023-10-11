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
}
