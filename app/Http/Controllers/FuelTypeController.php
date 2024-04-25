<?php

namespace App\Http\Controllers;

use App\Models\FuelType;
use Illuminate\Http\Request;

class FuelTypeController extends Controller
{
    public function index()
    {
        $fuelTypes = FuelType::all();
        return $fuelTypes;
    }

    public function store(Request $request)
    {
        $fuelType = new FuelType([
            'fueltype' => $request->input('fueltype'),
        ]);

        $fuelType->save();

        return response()->json($fuelType, 201);
    }

    public function show($id)
    {
        $fuelType = FuelType::find($id);
        return response()->json($fuelType);
    }
    public function update(Request $request, $id)
    {
        $fuelType = FuelType::find($id);
        $fuelType->update($request->all());
        return response()->json($fuelType, 200);
    }

    public function destroy($id)
    {
        $fuelType = FuelType::find($id);
        $fuelType->delete();
        return response()->json('Fuel Type Supprimée !');
    }
}
