<template>
    <div class="container mt-5 mb-md-4 py-5">
        <div class="row">
            <!-- Page content-->
            <form class="needs-validation pb-4" @submit.prevent="addCar">
            <div class="col-lg-12">
                <!-- Breadcrumb-->
                <nav class="mb-3 pt-md-3" aria-label="Breadcrumb">
                    <ol class="breadcrumb breadcrumb-light">
                        <li class="breadcrumb-item"><a href="">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Sell car</li>
                    </ol>
                </nav>
                <!-- Title-->
                <div class="mb-4">
                    <h1 class="h2 text-light mb-0">Sell car</h1>
                    <div class="d-lg-none text-light pt-3 mb-2">80% content filled</div>
                    <div class="progress progress-light d-lg-none mb-4" style="height: .25rem;">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
                <!-- Basic info-->
                <section class="card card-light card-body border-0 shadow-sm p-4 mb-4" id="basic-info">
                    <h2 class="h4 text-light mb-4"><i class="fi-info-circle text-primary fs-5 mt-n1 me-2"></i>Basic info</h2>
                      
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="mb-3">
                            <label class="form-label text-light" for="sc-title">Title <span class="text-danger">*</span></label>
                            <input class="form-control form-control-light" type="text"  id="car_type" v-model="car.title" placeholder="Title for your property"  required>
                        </div>
                        </div>
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="sc-condition">Vehicle condition <span class="text-danger">*</span></label>
                            <select class="form-select form-select-light" v-model="car.condition" required>
                                <option value="" disabled hidden>Choose condition</option>
                                <option value="Used">Used</option>
                                <option value="New">New</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-label text-light fw-bold pt-3 pb-2">Are you listing on Finder as part of a company?</div>
                    <div class="form-check form-check-light">
                        <input class="form-check-input" type="radio" name="fromcompany"  v-model="car.fromcompany" value="dealer">
                        <label class="form-check-label" for="sc-dealer">I am a registered dealer</label>
                    </div>
                    <div class="form-check form-check-light">
                        <input class="form-check-input" type="radio" id="individual" name="individual" v-model="car.fromcompany" value="individual" checked>
                        <label class="form-check-label" for="sc-individual">I am a private seller</label>
                    </div>
                </section>
                <!-- Price-->
                <section class="card card-light card-body border-0 shadow-sm p-4 mb-4" id="price">
                    <h2 class="h4 text-light mb-4"><i class="fi-cash text-primary fs-5 mt-n1 me-2"></i>Price</h2>
                    <label class="form-label text-light" for="sc-price">Price <span class="text-danger">*</span></label>
                    <div class="d-sm-flex mb-2">
                       
                        <input class="form-control form-control-light w-100 me-2 mb-2" type="number" id="sc-price"  v-model="car.price"  required>
                    </div>
                    <div class="form-check form-switch form-switch-light">
                        <input class="form-check-input" type="checkbox" v-model="car.Negotiated">
                        <label class="form-check-label" for="negotiated-price">Negotiated price</label>
                    </div>
                </section>
                <!-- Vehicle information-->
                <section class="card card-light card-body border-0 shadow-sm p-4 mb-4" id="vehicle-info">
                    <h2 class="h4 text-light mb-4"><i class="fi-car text-primary fs-5 mt-n1 me-2"></i>Vehicle information</h2>
                    <div class="row pb-2">
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="sc-make">Marque <span class="text-danger">*</span></label>
                            <select class="form-select form-select-light" id="sc-make" v-model="car.marque_id ">
                                <option value="" disabled >Select make</option>
                                <option v-for="m in marques" :key="m.id" :value=m.id>{{ m.name }}</option>
                                
                            </select>
                        </div>
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="sc-model">Model <span class="text-danger">*</span></label>
                            <select class="form-select form-select-light" id="sc-model" v-model="car.model_id">
                                <option value="" disabled >Select model</option>
                                <option v-for="m in models" :key="m.id" :value=m.id>{{ m.model_name }}</option>
                            </select>
                        </div>
                        <div class="col-md-6 col-sm-6 mb-3">
                            <label class="form-label text-light" for="sc-year">Year <span class="text-danger">*</span></label>
                            <select class="form-select form-select-light" id="sc-year" v-model="car.year">
                                <option value="" disabled>Select year</option>
                                <option value="2021">2021</option>
                                <option value="2020">2020</option>
                                <option value="2019">2019</option>
                                <option value="2018" selected>2018</option>
                                <option value="2017">2017</option>
                                <option value="2016">2016</option>
                                <option value="2015">2015</option>
                                <option value="2014">2014</option>
                                <option value="2013">2013</option>
                            </select>
                        </div>
                        <div class="col-md-6  mb-3">
                            <label class="form-label text-light" for="sc-mileage">Mileage <span class="text-danger">*</span></label>
                            <input class="form-control form-control-light" type="number" v-model="car.Mileage" min="0" step="1"  placeholder="Enter mileage">
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label text-light" for="sc-vin">VIN</label>
                            <input class="form-control form-control-light" type="number" v-model="car.vin"  placeholder="Enter VIN code">
                        </div>
                        <div class="col-md-4">
                            

                            <label class="form-label text-light" for="sc-condition">Transmission <span class="text-danger">*</span></label>
                            <select class="form-select form-select-light" v-model="car.transmission" required>
                                <option value="" disabled hidden>Select transmission</option>
                                <option value="Automatic">Automatic</option>
                                <option value="Manual">Manual</option>
                            </select>
                             
                        </div>

                        <div class="col-md-4">
                            

                            <label class="form-label text-light" for="sc-condition">Drivetrain <span class="text-danger">*</span></label>
                            <select class="form-select form-select-light" v-model="car.drivetrain" required>
                                <option value="" disabled hidden>Select Drivetrain</option>
                                <option value="Front">Front Wheel Drive</option>
                                <option value="Rear">Rear Wheel Drive</option>
                                <option value="All">All Wheel Drive</option>
                            </select>

                               
                        </div>

                    </div>
                    <div class="border-top border-light mt-2 pt-4">
                        <div class="row pb-2">
                            <div class="col-md-6">
                                <label class="form-label text-light" for="sc-body">Body type <span class="text-danger">*</span></label>
                                <select class="form-select form-select-light mb-3" v-model="car.bodytype_id">
                                    <option value="" disabled>Select body type</option>
                                    <option v-for="b in bodytypes" :key="b.id" :value=b.id>{{ b.car_type }}</option>
                                   
                                </select>

                                </div>
                                <div class="col-md-6">
                                <label class="form-label text-light" for="sc-fuel">Fuel type <span class="text-danger">*</span></label>
                                <select class="form-select form-select-light mb-3" id="sc-fuel" v-model="car.fueltype_id">
                                    <option value="" disabled>Select fuel type</option>
                                    <option v-for="e in fueltypes" :key="e.id" :value=e.id>{{ e.fueltype }}</option>
                                </select>
                                </div>
                                <div class="col-md-6">
                                <label class="form-label text-light" for="sc-engine">Engine <span class="text-danger">*</span></label>
                                <select class="form-select form-select-light mb-3" id="sc-engine" v-model="car.engine_id">
                                    <option value="" disabled>Select engine</option>
                                    <option v-for="e in engines" :key="e.id" :value=e.id>{{ e.engine_type }}</option>
                                   
                                </select>
                                </div>
                                <div class="col-md-6">
                                <label class="form-label text-light" for="sc-color">Color </label>
                                <input class="form-control form-control-light mb-3" type="text" v-model="car.color" placeholder="Enter color">
                            </div>
                        </div>
                    </div>
                    <div class="border-top border-light mt-2 pt-4">
                        <label class="form-label text-light" for="sc-description">Description </label>
                        <textarea class="form-control form-control-light" v-model="car.description" rows="5" placeholder="Describe your vehicle"></textarea><span class="form-text text-light opacity-50">3000 characters left</span>
                    </div>
                </section>
                <!-- Features-->
                <section class="card card-light card-body border-0 shadow-sm p-4 mb-4" id="features">
                    <h2 class="h4 text-light mb-4"><i class="fi-check-circle text-primary fs-5 mt-n1 me-2"></i>Features</h2>
                    <div class="mb-4">
                        <label class="form-label d-block text-light fw-bold mb-2 pb-1">Exterior</label>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="alloy-wheels" v-model="car.alloy_wheels">
                                    <label class="form-check-label" for="alloy-wheels">Alloy wheels</label>
                                </div>
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="sunroof" v-model="car.sunroof_moonroof">
                                    <label class="form-check-label" for="sunroof">Sunroof / moonroof</label>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="panoramic-roof" v-model="car.panoramic_roof">
                                    <label class="form-check-label" for="panoramic-roof">Panoramic roof</label>
                                </div>
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="tinted-glass" v-model="car.tinted_glass">
                                    <label class="form-check-label" for="tinted-glass">Tinted glass</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label d-block text-light fw-bold mb-2 pb-1">Interior</label>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="ac" v-model="car.multi_zone_ac">
                                    <label class="form-check-label" for="ac">Multi-zone A/C</label>
                                </div>
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="heated-seats" v-model="car.heated_front_seats">
                                    <label class="form-check-label" for="heated-seats">Heated front seats</label>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="navi" v-model="car.navigation_system">
                                    <label class="form-check-label" for="navi">Navigation system</label>
                                </div>
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="leather-seats" v-model="car.leather_seats">
                                    <label class="form-check-label" for="leather-seats">Leather seats</label>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="wipers" v-model="car.intermittent_wipers">
                                    <label class="form-check-label" for="wipers">Intermittent wipers</label>
                                </div>
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="memory-seat" v-model="car.memory_seat">
                                    <label class="form-check-label" for="memory-seat">Memory seat</label>
                                </div>
                            </div>
                        </div>
                        <div class="" >
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-check form-check-light">
                                        <input class="form-check-input" type="checkbox" id="premium-sound" v-model="car.premium_sound_system">
                                        <label class="form-check-label" for="premium-sound">Premium sound system</label>
                                    </div>
                                    <div class="form-check form-check-light">
                                        <input class="form-check-input" type="checkbox" id="bluetooth" v-model="car.bluetooth">
                                        <label class="form-check-label" for="bluetooth">Bluetooth</label>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-check form-check-light">
                                        <input class="form-check-input" type="checkbox" id="usb" v-model="car.usb_port">
                                        <label class="form-check-label" for="usb">USB port</label>
                                    </div>
                                    <div class="form-check form-check-light">
                                        <input class="form-check-input" type="checkbox" id="leather-wheel" v-model="car.leather_steering_wheel">
                                        <label class="form-check-label" for="leather-wheel">Leather steering wheel</label>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-check form-check-light">
                                        <input class="form-check-input" type="checkbox" id="apple-play" v-model="car.apple_carplay">
                                        <label class="form-check-label" for="apple-play">Apple CarPlay</label>
                                    </div>
                                    <div class="form-check form-check-light">
                                        <input class="form-check-input" type="checkbox" id="android-auto" v-model="car.android_auto">
                                        <label class="form-check-label" for="android-auto">Android Auto</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="mb-4">
                        <label class="form-label d-block text-light fw-bold mb-2 pb-1">Safety</label>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="airbag-driver" v-model="car.airbag_driver">
                                    <label class="form-check-label" for="airbag-driver">Airbag: driver</label>
                                </div>
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="airbag-pasenger" v-model="car.airbag_passenger">
                                    <label class="form-check-label" for="airbag-pasenger">Airbag: passenger</label>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="alarm" v-model="car.alarm">
                                    <label class="form-check-label" for="alarm">Alarm</label>
                                </div>
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="antilock" v-model="car.antilock_brakes">
                                    <label class="form-check-label" for="antilock">Antilock brakes</label>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="stability-control" v-model="car.stability_control">
                                    <label class="form-check-label" for="stability-control">Stability control</label>
                                </div>
                                <div class="form-check form-check-light">
                                    <input class="form-check-input" type="checkbox" id="fog-lights" v-model="car.fog_lights">
                                    <label class="form-check-label" for="fog-lights">Fog lights</label>
                                </div>
                            </div>
                        </div>
                        <div class="" >
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-check form-check-light">
                                        <input class="form-check-input" type="checkbox" id="adaptive-cruise" v-model="car.adaptive_cruise_control">
                                        <label class="form-check-label" for="adaptive-cruise">Adaptive cruise control</label>
                                    </div>
                                    <div class="form-check form-check-light">
                                        <input class="form-check-input" type="checkbox" id="blind-monitor" v-model="car.blind_spot_monitor">
                                        <label class="form-check-label" for="blind-monitor">Blind spot monitor</label>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-check form-check-light">
                                        <input class="form-check-input" type="checkbox" id="brake-assist" v-model="car.brake_assist">
                                        <label class="form-check-label" for="brake-assist">Brake assist</label>
                                    </div>
                                    <div class="form-check form-check-light">
                                        <input class="form-check-input" type="checkbox" id="lane-warning" v-model="car.lane_departure_warning">
                                        <label class="form-check-label" for="lane-warning">Lane departure warning</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Photos / video-->
              <!--   <section class="card card-light card-body shadow-sm p-4 mb-4" id="photos">
                    <h2 class="h4 text-light mb-4"><i class="fi-image text-primary fs-5 mt-n1 me-2"></i>Photos / video</h2>
                    <div class="alert alert-warning bg-faded-warning border-warning mb-4" role="alert">
                        <div class="d-flex"><i class="fi-alert-circle me-2 me-sm-3"></i>
                            <p class="fs-sm mb-1">The maximum photo size is 8 MB. Formats: jpeg, jpg, png. Put the main picture first.<br>The maximum video size is 10 MB. Formats: mp4, mov.</p>
                        </div>
                    </div>
                    <input class="file-uploader file-uploader-grid bg-faded-light border-light" type="file" multiple data-max-file-size="10MB" accept="image/png, image/jpeg, video/mp4, video/mov" data-label-idle="&lt;div class=&quot;btn btn-primary mb-3&quot;&gt;&lt;i class=&quot;fi-cloud-upload me-1&quot;&gt;&lt;/i&gt;Upload photos / video&lt;/div&gt;&lt;div class=&quot;text-light opacity-70&quot;&gt;or drag them in&lt;/div&gt;">
                </section> -->

                <section class="card card-light card-body shadow-sm  mb-4" id="photos">
                    <h2 class="h4 text-light mb-4"><i class="fi-image text-primary fs-5 mt-n1 me-2"></i>Photos / video</h2>
                            <file-pond
                            name="test"
                            ref="pond"
                            class-name="my-pond"
                            label-idle="Drop files here..."
                            allow-multiple="true"
                            accepted-file-types="image/jpeg, image/png"
                            v-bind:files="myFiles"
                            v-on:init="handleFilePondInit"
                            :server="serverOptions()"
                            />
                        </section>

                <!-- Location-->
                <section class="card card-light card-body border-0 shadow-sm p-4 mb-4" id="location">
                    <h2 class="h4 text-light mb-4"><i class="fi-map-pin text-primary fs-5 mt-n1 me-2"></i>Location</h2>
                    <div class="row">
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="sc-country">Country / region <span class="text-danger">*</span></label>
                            <select class="form-select form-select-light" v-model="car.country_id" required>
                                <option value="" disabled>Choose country</option>
                                <option v-for="cou in countries" :key="cou.id" :value=cou.id>{{ cou.name }}</option>
                            </select>
                        </div>
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="sc-state">State <span class="text-danger">*</span></label>
                            <select class="form-select form-select-light" v-model="car.state_id" required>
                                <option value="" disabled>Choose state</option>
                                <option v-for="s in states" :key="s.id" :value=s.id>{{ s.name }}</option>
                            </select>
                        </div>
                    </div>
                    <div class="row"> 
                         <!--    <input type="text" v-model="car.user_id" > -->
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="sc-zip">Zip code  <span class="text-danger">*</span></label>
                            <input class="form-control form-control-light" type="text" v-model="car.zipcode" placeholder="Enter Zip code" value="60603" required>
                        </div>
                    
                        <div class=" col-sm-6 mb-3">
                            <label class="form-label text-light" for="ap-address">Street address <span class="text-danger">*</span></label>
                            <input class="form-control form-control-light" type="text" v-model="car.address" value="1904 S Michigan Avenue" required>
                        </div>
                    </div>
                </section>
               
                <div class="d-sm-flex justify-content-between pt-2"><button class="btn btn-primary btn-lg d-block mb-2" type="submit">Save and continue</button></div>
            </div>
            </form>
        </div>
    </div>
</template>

<script setup>

const auth_user = ref({
    id:"",
});

import vueFilePond from 'vue-filepond';
import 'filepond/dist/filepond.min.css';
import FilePondPluginImagePreview from 'filepond-plugin-image-preview';

import 'filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css';


const FilePond = vueFilePond(FilePondPluginImagePreview);


import { ref,onMounted } from "vue"
import { useRouter } from 'vue-router';
const router = useRouter()
import axios from 'axios';
const car=ref({
   
    marque_id:"",
    photos: [],
    user_id:auth_user.id

})
const addCar=async()=>{
    await
        axios.post("http://localhost:8000/api/cars/",car.value)
            .then(() => (

                router.push({ name: 'cars' })
            ))
            .catch(err => console.log(err))

}


const marques = ref([]);
const models = ref([]);
const bodytypes = ref([]);
const fueltypes = ref([]);
const engines = ref([]);
const countries = ref([]);
const states = ref([]);

const getmarques = () => {

    axios.get('http://localhost:8000/api/marques').then(res => {
        marques.value = res.data;
    }).catch(error => {
        console.log(error)
    });
}

const getmodels=async()=>{
    await axios.get("http://localhost:8000/api/models")
        .then(res=>{
            models.value=res.data
            console.log(models.value)
        })
        .catch(error=>{
            console.log(error)
        })
}

const getbodytypes=async()=>{
    await axios.get("http://localhost:8000/api/bodytypes")
        .then(res=>{
            bodytypes.value=res.data
            console.log(bodytypes.value)
        })
        .catch(error=>{
            console.log(error)
        })
}

const getfueltypes=async()=>{
    await axios.get("http://localhost:8000/api/fueltypes")
        .then(res=>{
            fueltypes.value=res.data
        })
        .catch(error=>{
            console.log(error)
        })
}

const getengines=async()=>{
    await axios.get("http://localhost:8000/api/engines")
        .then(res=>{
            engines.value=res.data
        })
        .catch(error=>{
            console.log(error)
        })
}

const getcountries = async () => {
    try {
        const response = await axios.get('http://localhost:8000/api/countries');
        countries.value = response.data;
    } catch (error) {
        console.error(error);
    }
};

const getstates=async()=>{
    await axios.get("http://localhost:8000/api/states")
        .then(res=>{
            states.value=res.data
            console.log(states.value)
        })
        .catch(error=>{
            console.log(error)
        })
}



const handleFilePondInit = async () => {

    if (car.value.photos.length > 0) {
        myFiles.value = car.value.photos.map(photo => ({
            source: photo,
            options: { type: 'local' }
        }));
    }
}
const serverOptions = () => {
    return {
        process: async (fieldName, file, metadata, load, error, progress, abort) => {
            const data = new FormData();
            data.append('file', file);
            data.append('upload_preset', 'GLID5IIT');
            data.append('cloud_name', 'esps');
            data.append('public_id', file.name);

            try {
                const response = await axios.post('https://api.cloudinary.com/v1_1/esps/upload', data);
                const imageUrl = response.data.url;

                car.value.photos.push(imageUrl);
                load(imageUrl);
            } catch (err) {
                console.error('Error uploading file:', err);
                error('Upload failed');
                abort();
            }
        },
    };
};



const myFiles = ref([]);



const getUser = async () => {
    try {
        let token = localStorage.getItem('token');
        const response = await axios.get("http://localhost:8000/api/user", {
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });

        // Check if the response has the expected structure
        if (response.data) {
            auth_user.value = response.data;
           // car.value.user_id = auth_user.id;
            car.value.user_id = auth_user.value.id;
            console.log(auth_user);
            console.log("ggg",auth_user.value);
        } else {
            console.error('Invalid response structure:', response.data);
        }
    } catch (error) {
        console.error('Error fetching authenticated user:', error);
    }
}

onMounted(() => {
    getmarques();
    getmodels();
    getbodytypes();
    getfueltypes();
    getengines();
    getcountries();
    getstates();
    getUser();
})
</script>


