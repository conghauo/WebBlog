<?php

namespace App\Http\Middleware;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Config;
use Closure;
use Illuminate\Http\Request;
use Auth;
class IsAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
	if (Auth::check()) {
	    $user = Auth::user();
            
            $flarum_user_group = DB::connection(Config::get('flarum.db_connection'))->table('ts_group_user')->where('user_id', $user->flarum_id)->first();
	     
	    if ($flarum_user_group && $flarum_user_group->group_id == 1)
	    	return $next($request);
        }

        return redirect('welcome')->with('error','You have not admin access');
    }
}
