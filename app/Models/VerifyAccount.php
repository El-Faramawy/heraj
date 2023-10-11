<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VerifyAccount extends Model
{
    use HasFactory;
    protected $guarded = [];
    public function getImage1Attribute(){
        return  get_file($this->attributes['image1']);
    }
    public function getImage2Attribute(){
        return  get_file($this->attributes['image2']);
    }
}
