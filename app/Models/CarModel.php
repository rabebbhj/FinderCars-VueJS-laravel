<?php

namespace App\Models;

use App\Models\Marque;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class CarModel extends Model
{
    use HasFactory;
    protected $table = 'models';
    protected $guarded = [];

    public function marque()
    {
        return $this->belongsTo(Marque::class, 'marque_id');
    }
}
