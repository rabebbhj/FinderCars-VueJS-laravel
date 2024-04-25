<?php

namespace App\Http\Controllers;

use App\Models\Marque;
use Illuminate\Http\Request;

class MarqueController extends Controller
{
    public function index()
    {
        $marques = Marque::all();
        return $marques;
    }

    public function store(Request $request)
    {
        $marque = new Marque([
            'name' => $request->input('name'),
            'slug' => $request->input('slug'),
            'marque_image' => $request->input('marque_image'),
        ]);

        $marque->save();

        return response()->json($marque, 201);
    }

    public function show($id)
    {
        $marque = Marque::find($id);
        return response()->json($marque);
    }
    public function update(Request $request, $id)
    {
        $marque = Marque::find($id);
        $marque->update($request->all());
        return response()->json($marque, 200);
    }

    public function destroy($id)
    {
        $marque = Marque::find($id);
        $marque->delete();
        return response()->json('Marque supprimée !');
    }
}
