<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('cars', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('condition');
            $table->string('fromcompany');
            $table->integer('price');
            $table->boolean('Negotiated')->default(false);

            $table->unsignedBigInteger('marque_id');
            $table->foreign('marque_id')->references('id')->on('marques');

            $table->unsignedBigInteger('model_id');
            $table->foreign('model_id')->references('id')->on('models');

            $table->integer('year');
            $table->integer('Mileage');
            $table->integer('VIN');

            $table->unsignedBigInteger('bodytype_id');
            $table->foreign('bodytype_id')->references('id')->on('bodytypes')->onDelete('cascade');

            $table->unsignedBigInteger('fueltype_id');
            $table->foreign('fueltype_id')->references('id')->on('fueltypes')->onDelete('cascade');

            $table->unsignedBigInteger('engine_id');
            $table->foreign('engine_id')->references('id')->on('engines')->onDelete('cascade');

            $table->string('transmission');
            $table->string('drivetrain');
            $table->string('color');
            $table->text('description');

            // lel exterior
            $table->boolean('alloy_wheels')->default(false)->nullable();
            $table->boolean('sunroof_moonroof')->default(false)->nullable();
            $table->boolean('panoramic_roof')->default(false)->nullable();
            $table->boolean('tinted_glass')->default(false)->nullable();


            // lel interior
            $table->boolean('multi_zone_ac')->default(false)->nullable();
            $table->boolean('heated_front_seats')->default(false)->nullable();
            $table->boolean('navigation_system')->default(false)->nullable();
            $table->boolean('leather_seats')->default(false)->nullable();
            $table->boolean('intermittent_wipers')->default(false)->nullable();
            $table->boolean('memory_seat')->default(false)->nullable();
            $table->boolean('premium_sound_system')->default(false)->nullable();
            $table->boolean('bluetooth')->default(false)->nullable();
            $table->boolean('usb_port')->default(false)->nullable();
            $table->boolean('leather_steering_wheel')->default(false)->nullable();
            $table->boolean('apple_carplay')->default(false)->nullable();
            $table->boolean('android_auto')->default(false)->nullable();


            // lel safety
            $table->boolean('airbag_driver')->default(false)->nullable();
            $table->boolean('airbag_passenger')->default(false)->nullable();
            $table->boolean('alarm')->default(false)->nullable();
            $table->boolean('antilock_brakes')->default(false)->nullable();
            $table->boolean('stability_control')->default(false)->nullable();
            $table->boolean('fog_lights')->default(false)->nullable();
            $table->boolean('adaptive_cruise_control')->default(false)->nullable();
            $table->boolean('blind_spot_monitor')->default(false)->nullable();
            $table->boolean('brake_assist')->default(false)->nullable();
            $table->boolean('lane_departure_warning')->default(false)->nullable();

            $table->unsignedBigInteger('country_id');
            $table->foreign('country_id')->references('id')->on('countries')->onDelete('cascade');

            $table->unsignedBigInteger('state_id');
            $table->foreign('state_id')->references('id')->on('states')->onDelete('cascade');

            $table->string('zipcode');

            $table->string('address');
            $table->string('adnumber')->nullable();
            $table->string('views')->nullable()->defaultValue(0);
            $table->integer('status')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cars');
    }
};
