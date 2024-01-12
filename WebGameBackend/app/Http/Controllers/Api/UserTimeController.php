<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\UserTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;

class UserTimeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Models\UserTime  $userTime
     * @return \Illuminate\Http\Response
     */
    public function show(UserTime $userTime)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Models\UserTime  $userTime
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, UserTime $userTime)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Models\UserTime  $userTime
     * @return \Illuminate\Http\Response
     */
    public function destroy(UserTime $userTime)
    {
        //
    }
    public function getTimeCurrentUser()
    {
	if (Auth::check() )
        {
            $user = Auth::user();
	    $userTime = UserTime::where('user_id',$user->id)->first();
	    if(!$userTime)
	    {
	     $userTime = UserTime::Create( [ 'user_id' => $user->id , 'mins' => 5 ,'seconds' => 0 ] );
	    }
	   // $userTime = UserTime::where('user_id',$user->id)->first();
	    return response()->json(['user_id'=>$userTime->user_id,
	    'mins'=>$userTime->mins,
            'seconds'=>$userTime->seconds ], 200 );	    
	}
	 return response()->json([
                'error' => "Unauthen"
                ], 403);
    }
}
