<?php

namespace App\Http\Controllers;

use App\Models\Engine;
use Illuminate\Http\Request;

class EngineController extends Controller
{
    public function index()
    {
        $Engines = Engine::all();
        return $Engines;
    }

    public function store(Request $request)
    {
        $engine = new Engine([
            'engine_type' => $request->input('engine_type'),
        ]);

        $engine->save();

        return response()->json($engine, 201);
    }

    public function show($id)
    {
        $Engine = Engine::find($id);
        return response()->json($Engine);
    }
    public function update(Request $request, $id)
    {
        $engine = Engine::find($id);
        $engine->update($request->all());
        return response()->json($engine, 200);
    }

    public function destroy($id)
    {
        $engine = Engine::find($id);
        $engine->delete();
        return response()->json('Engine supprimée !');
    }
}
