<?php

namespace App\Models;

use App\Models\Car;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class CarImages extends Model
{
    use HasFactory;

    protected $table = 'car_images';
    protected $guarded = [];

    public function car()
    {
        return $this->belongsTo(Car::class, 'car_id');
    }
}
