<?php

namespace App\Http\Controllers;

use App\Models\Car;
use App\Models\CarImages;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CarController extends Controller
{
    public function index()
    {
        $cars = Car::with('marque','carmodel','bodytype','fueltype','engine','country','state','carimages','user')->get();
        return $cars;
    }

    public function store(Request $request)
    {
        $car = new Car();

        $car->title = $request->input('title');
        $car->condition = $request->input('condition');
        $car->fromcompany = $request->input('fromcompany');
        $car->price = $request->input('price');
        $car->Negotiated = $request->input('Negotiated');

        $car->marque_id = $request->input('marque_id');
        $car->model_id = $request->input('model_id');
        $car->year = $request->input('year');
        $car->Mileage = $request->input('Mileage');
        $car->VIN = $request->input('vin');

        $car->bodytype_id = $request->input('bodytype_id');
        $car->fueltype_id = $request->input('fueltype_id');
        $car->engine_id = $request->input('engine_id');
        $car->transmission = $request->input('transmission');
        $car->drivetrain = $request->input('drivetrain');
        $car->color = $request->input('color');
        $car->description = $request->input('description');

        // exterior
        $car->alloy_wheels = $request->input('alloy_wheels');
        $car->sunroof_moonroof = $request->input('sunroof_moonroof');
        $car->panoramic_roof = $request->input('panoramic_roof');
        $car->tinted_glass = $request->input('tinted_glass');

        // interior
        $car->multi_zone_ac = $request->input('multi_zone_ac');
        $car->heated_front_seats = $request->input('heated_front_seats');
        $car->navigation_system = $request->input('navigation_system');
        $car->leather_seats = $request->input('leather_seats');
        $car->intermittent_wipers = $request->input('intermittent_wipers');
        $car->memory_seat = $request->input('memory_seat');
        $car->premium_sound_system = $request->input('premium_sound_system');
        $car->bluetooth = $request->input('bluetooth');
        $car->usb_port = $request->input('usb_port');
        $car->leather_steering_wheel = $request->input('leather_steering_wheel');
        $car->apple_carplay = $request->input('apple_carplay');
        $car->android_auto = $request->input('android_auto');

        // safety
        $car->airbag_driver = $request->input('airbag_driver');
        $car->airbag_passenger = $request->input('airbag_passenger');
        $car->alarm = $request->input('alarm');
        $car->antilock_brakes = $request->input('antilock_brakes');
        $car->stability_control = $request->input('stability_control');
        $car->fog_lights = $request->input('fog_lights');
        $car->adaptive_cruise_control = $request->input('adaptive_cruise_control');
        $car->blind_spot_monitor = $request->input('blind_spot_monitor');
        $car->brake_assist = $request->input('brake_assist');
        $car->lane_departure_warning = $request->input('lane_departure_warning');

        $car->country_id = $request->input('country_id');
        $car->state_id = $request->input('state_id');
        $car->zipcode = $request->input('zipcode');

        $car->address = $request->input('address');
        $car->adnumber = $request->input('adnumber');
        $car->user_id = $request['user_id'];

        $car->views = 0;
        $car->save();

        if ($request->has('photos') && is_array($request->input('photos'))) {
            foreach ($request->input('photos') as $photo) {
                $carImage = new CarImages([
                    'photo_name' => $photo,
                ]);
                $car->carimages()->save($carImage);
            }
        }

        return response()->json($car, 201);
    }

    public function show($id)
    {
        $cars = Car::with('carmodel','bodytype','fueltype','engine','country','state','carimages','user')->findOrFail($id);
        $cars->increment('views');

        return $cars;
    }
    public function update(Request $request, $id)
    {
        $car = Car::find($id);
        $car->update($request->all());
        return response()->json($car, 200);
    }

    public function destroy($id)
    {
        $car = Car::find($id);
        $car->delete();
        return response()->json('Car supprimée !');
    }


    public function filterlistcars(Request $request){

        $query = Car::with('marque', 'carmodel', 'bodytype', 'fueltype', 'engine', 'country', 'state', 'carimages');
       /*  \Log::info('Received Request Data:', $request->all()); */


        if ($request->has('selectedCountry')) {
            $query->where('country_id', $request->input('selectedCountry'));
        }

        $selectedYear = $request->input('selectedYear');
        if ($selectedYear!=null) {
            $query->where('year',$selectedYear);
        }


        $bodyTypes = $request->input('selectedBodyTypes');
        if ($bodyTypes!=null) {

           // \Log::info('Selected Body Types:', $bodyTypes);
            $query->whereIn('bodytype_id', $bodyTypes);
        }

        $mileageRange = $request->input('mileageRange');
        if ($mileageRange) {
            $mileageRange = $request->input('mileageRange');

            if (!is_null($mileageRange['from'])) {
                $query->where('Mileage', '>=', $mileageRange['from']);
            }

            if (!is_null($mileageRange['to'])) {
                $query->where('Mileage', '<=', $mileageRange['to']);
            }
        }

        $filteredCars = $query->get();

        return response()->json($filteredCars);
    }


    public function getusercars($id)
    {
        $cars = Car::with('carmodel','bodytype','fueltype','engine','country','state','carimages','user')
        ->where('user_id',$id)->get();


        return $cars;
    }
}
