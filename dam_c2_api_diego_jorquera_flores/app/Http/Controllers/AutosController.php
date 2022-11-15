<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Auto;
use App\Http\Requests\GuardarAutoRequest;
use App\Http\Requests\ActualizarAutoRequest;
use Illuminate\Http\Request;

class AutosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Auto::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(GuardarAutoRequest $request)
    {
        Auto::create($request->all());
        return response()->json([
            'res' => true,
            'msg' => 'Auto Guardado Correctamente.'
        ],200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Auto  $auto
     * @return \Illuminate\Http\Response
     */
    public function show(Auto $auto)
    {
        return response()->json([
            'res' =>true,
            'auto' => $auto
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Auto  $auto
     * @return \Illuminate\Http\Response
     */
    public function update(ActualizarAutoRequest $request, Auto $auto)
    {
        $auto->update($request->all());
        return response()->json([
            'res' => true,
            'mensaje' => 'Actualizado correctamente.'
        ],200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Auto  $auto
     * @return \Illuminate\Http\Response
     */
    public function destroy(Auto $auto)
    {
        //
    }
}
