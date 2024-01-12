<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserTime extends Model
{
	use HasFactory;
	 protected $fillable = [
        'user_id' , 'mins', 'seconds'
    ];

}
