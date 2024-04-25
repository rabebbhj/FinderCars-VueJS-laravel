<?php

namespace App\Http\Controllers;

use App\Models\Country;
use Illuminate\Http\Request;

class CountryController extends Controller
{
    public function index()
    {
        $country = Country::all();
        return $country;
    }

    public function store(Request $request)
    {
        $country = new Country([
            'name' => $request->input('name'),
        ]);

        $country->save();

        return response()->json($country, 201);
    }

    public function show($id)
    {
        $country = Country::find($id);
        return response()->json($country);
    }
    public function update(Request $request, $id)
    {
        $country = Country::find($id);
        $country->update($request->all());
        return response()->json($country, 200);
    }

    public function destroy($id)
    {
        $country = Country::find($id);
        $country->delete();
        return response()->json('Country supprimée !');
    }
}
