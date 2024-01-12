<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Bausch\FlarumLaravelSession\FlarumLaravelSession;
use Bausch\FlarumLaravelSession\Actions\HandleIdentifiedUser;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
	 FlarumLaravelSession::handleIdentifiedUser(HandleIdentifiedUser::class);
        //FlarumLaravelSession::useUserModel(User::class);
        //
    }
}
