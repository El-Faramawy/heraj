<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    use HasFactory;
    protected $guarded = [];
    public function getImageAttribute(){
        return  get_file($this->attributes['image']);
    }

    public function product(){
        return $this->belongsTo(Product::class);
    }
}
