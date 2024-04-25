<?php

namespace App\Http\Controllers;

use App\Models\State;
use Illuminate\Http\Request;

class StateController extends Controller
{
    public function index()
    {
        $states = State::all();
        return $states;
    }

    public function store(Request $request)
    {
        $state = new State([
            'name' => $request->input('name'),
            'country_id' => $request->input('country_id')
        ]);

        $state->save();

        return response()->json($state, 201);
    }

    public function show($id)
    {
        $state = State::find($id);
        return response()->json($state);
    }
    public function update(Request $request, $id)
    {
        $state = State::find($id);
        $state->update($request->all());
        return response()->json($state, 200);
    }

    public function destroy($id)
    {
        $state = State::find($id);
        $state->delete();
        return response()->json('Sate supprimée !');
    }
}
