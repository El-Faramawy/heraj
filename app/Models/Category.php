<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $guarded = [];
    protected $table = 'categories';
    protected $appends =['name'];

    //===================  name ===========================
    public function getNameAttribute(){
        $name = $this->attributes['name_ar'];
        if (request()->header('lang') && request()->header('lang') != null)
            $name = $this->attributes['name_'.request()->header('lang')];
        elseif(request()->get('lang') && request()->get('lang') != null)
            $name = $this->attributes['name_'.request()->get('lang')];
        elseif(request()->lang && request()->lang != null)
            $name = $this->attributes['name_'.request()->lang];
        return $name;
    }

    public function getImageAttribute(){
        return  get_file($this->attributes['image']);
    }

//    //===================  products ===========================
    public function products()
    {
        return $this->hasMany(Product::class);
    }
//    //===================  sub_category ===========================
    public function sub_categories()
    {
        return $this->hasMany(SubCategory::class);
    }

}
