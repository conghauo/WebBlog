<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\HistoryPayment;
use Illuminate\Http\Request;

class PayHistoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return HistoryPayment::all(); 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return HistoryPayment::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Models\HistoryPayment  $historyPayment
     * @return \Illuminate\Http\Response
     */
    public function show(HistoryPayment $historyPayment)
    {
        return $historyPayment;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Models\HistoryPayment  $historyPayment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, HistoryPayment $historyPayment)
    {
        return $historyPayment->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Models\HistoryPayment  $historyPayment
     * @return \Illuminate\Http\Response
     */
    public function destroy(HistoryPayment $historyPayment)
    {
        $historyPayment->delete();
    }
}
