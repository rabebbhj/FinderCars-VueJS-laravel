<?php

namespace App\Http\Controllers;

use App\Models\BodyType;
use Illuminate\Http\Request;

class BodyTypeController extends Controller
{
    public function index()
    {
        $bodyTypes = BodyType::all();
        return $bodyTypes;
    }

    public function store(Request $request)
    {
        $bodyType = new BodyType([
            'car_type' => $request->input('car_type'),
            'type_image' => $request->input('type_image'),
        ]);

        $bodyType->save();

        return response()->json($bodyType, 201);
    }

    public function show($id)
    {
        $bodyType = BodyType::find($id);
        return response()->json($bodyType);
    }
    public function update(Request $request, $id)
    {
        $bodyType = BodyType::find($id);
        $bodyType->update($request->all());
        return response()->json($bodyType, 200);
    }

    public function destroy($id)
    {
        $bodyType = BodyType::find($id);
        $bodyType->delete();
        return response()->json('Body Type Supprimée !');
    }
}
