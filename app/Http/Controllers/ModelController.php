<?php

namespace App\Http\Controllers;

use App\Models\CarModel;
use App\Models\Marque;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class ModelController extends Controller
{
    public function index()
    {
        $models = CarModel::with('marque')->get();
        return $models;
    }

    public function store(Request $request)
    {
        $carModel = new CarModel([
            'model_name' => $request->input('model_name'),
            'model_slug' => $request->input('model_slug'),
            'marque_id' => $request->input('marque_id'),
        ]);

        $carModel->save();

        return response()->json($carModel, 201);
    }

    public function show($id)
    {
        $carModel = CarModel::find($id);
        return response()->json($carModel);
    }
    public function update(Request $request, $id)
    {
        $carModel = CarModel::find($id);
        $carModel->update($request->all());
        return response()->json($carModel, 200);
    }

    public function destroy($id)
    {
        $carModel = CarModel::find($id);
        $carModel->delete();
        return response()->json('Car Model supprimée !');
    }
}
