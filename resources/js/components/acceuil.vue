<template>

    <section class="bg-position-top-center bg-repeat-0 pt-5" style="background-image: url(/assets/img/car-finder/home/hero-bg.png); background-size: 1920px 630px;">
        <div class="container pt-5">
            <div class="row pt-lg-4 pt-xl-5">
                <div class="col-lg-4 col-md-5 pt-3 pt-md-4 pt-lg-5">
                    <h1 class="display-4 text-light pb-2 mb-4 me-md-n5">Easy way to find the right car</h1>
                    <p class="fs-lg text-light opacity-70">Finder is a leading digital marketplace for the automotive industry that connects car shoppers with sellers. </p>
                </div>
                <div class="col-lg-8 col-md-7 pt-md-5"><img class="d-block mt-4 ms-auto" :src="'/assets/img/car-finder/home/hero-img.png'" width="800" alt="Car"></div>
            </div>
        </div>
        <div class="container mt-4 mt-sm-3 mt-lg-n3 pb-5 mb-md-4">
            <!-- Tabs-->

            <!-- Form group-->
            <form class="form-group form-group-light d-block">
                <div class="row g-0 ms-lg-n2">
                    <div class="col-lg-10">
                        <div class="input-group border-end-lg border-light"><span class="input-group-text text-muted ps-2 ps-sm-3"><i class="fi-search"></i></span>
                            <input class="form-control" type="text" name="keywords" placeholder="Keywords...">
                        </div>
                    </div>


                    <div class="col-lg-2">
                        <button class="btn btn-primary w-100" type="submit">Search</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Body type selection-->
    <section class="container pb-5 mb-md-4">
        <div class="d-sm-flex align-items-center justify-content-between mb-3 mb-sm-4 pb-sm-2">
            <h2 class="h3 text-light mb-2 mb-sm-0">Popular car body types</h2><a class="btn btn-link btn-light fw-normal px-0" href="/listCar">View all<i class="fi-arrow-long-right fs-sm mt-0 ps-1 ms-2"></i></a>
        </div>
        <div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5 g-2 g-md-4">
            <!-- Item-->
            <div class="col" v-for="bt in bodytypes" :key="bt.id">
    <div class="card card-body card-light card-hover bg-transparent border-0 px-0 pt-0 text-center">
        <img class="d-block mx-auto mb-3 rounded image-size" :src="bt.type_image" alt="Sedan">
        <a class="nav-link-light stretched-link fw-bold" href="">{{ bt.car_type }}</a>
    </div>
</div>


        </div>
    </section>
    <!-- Top offers-->
    <section class="container pt-sm-1 pb-5 mb-md-4">
        <div class="d-sm-flex align-items-center justify-content-between mb-4 pb-sm-2">
            <h2 class="h3 text-light mb-2 mb-sm-0">Top offers</h2><a class="btn btn-link btn-light fw-normal px-0" href="/listCar">View all offers<i class="fi-arrow-long-right fs-sm mt-0 ps-1 ms-2"></i></a>
        </div>
        <div class="row">

            <div class="col-lg-6" v-for="md in cars" :key="md.id">

                 <!-- Item-->
                 <div class="card card-light card-hover card-horizontal mb-4" >

                 <div class="card card-img-top card-img-hover" @click="showcar(md.id)">

                         <div class="position-absolute start-0 top-0 pt-3 ps-3">
                             <span class="d-table badge bg-info">{{ md.condition }}</span>
                         </div>
                         <div class="content-overlay end-0 top-0 pt-3 pe-3">
                             <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist">
                                 <i class="fi-heart"></i>
                             </button>
                         </div>
                         <div v-if="md.carimages && md.carimages.length > 0" class="bg-size-cover bg-position-center w-100 h-100" :style="{ backgroundImage: 'url(' + md.carimages[0].photo_name + ')' }"></div>


                     </div>


                 <div class="card-body position-relative">

                     <div class="fs-sm text-light pb-1">{{md.year}}</div>
                     <h3 class="h6 mb-1"><a class="nav-link-light" href="">{{md.title}}</a></h3>
                     <div class="text-primary fw-bold mb-1">{{md.price}} DT</div>
                     <div class="fs-sm text-light opacity-70"><i class="fi-map-pin me-1"></i>{{md.country.name}} | {{md.state.name}}</div>
                     <div class="border-top border-light mt-3 pt-3">
                         <div class="row g-2">
                             <div class="col me-sm-1">
                                 <div class="bg-dark rounded text-center w-100 h-100 p-2"><i class="fi-dashboard d-block h4 text-light mb-0 mx-center"></i><span class="fs-xs text-light">{{md.Mileage}}K mi</span></div>
                             </div>
                             <div class="col me-sm-1">
                                 <div class="bg-dark rounded text-center w-100 h-100 p-2"><i class="fi-gearbox d-block h4 text-light mb-0 mx-center"></i><span class="fs-xs text-light">{{md.transmission}}</span></div>
                             </div>
                             <div class="col">
                                 <div class="bg-dark rounded text-center w-100 h-100 p-2"><i class="fi-petrol d-block h4 text-light mb-0 mx-center"></i><span class="fs-xs text-light">{{md.fueltype.fueltype}}</span></div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>

            </div>
        </div>
    </section>
    <!-- Brands-->
    <section class="container py-2 py-sm-3">
        <div class="row g-2 g-sm-4">
            <div class="col-3 col-sm-2 col-xl-1 mb-4 pb-2" v-for="mq in marques" :key="mq.id">
    <a class="opacity-40 opacity-transition d-table mx-auto" href="#">
        <img class="rounded-circlee image-size-cercle" :src="mq.marque_image" alt="Opel">
    </a>
</div>


        </div>
    </section>
    <!-- Features-->
    <section class="container pt-4 pt-md-5">
        <div class="d-sm-flex align-items-center justify-content-between">
            <h2 class="h3 text-light mb-2 mb-sm-0">What sets Finder apart?</h2><a class="btn btn-link btn-light fw-normal px-0" href="#">How to sell cars on Finder<i class="fi-arrow-long-right fs-sm mt-0 ps-1 ms-2"></i></a>
        </div>
        <div class="row">
            <div class="col-md-5 col-lg-4 offset-lg-1 pt-4 mt-2 pt-md-5 mt-md-3">
                <div class="d-flex pb-4 pb-md-5 mb-2"><i class="fi-file lead text-primary mt-1 order-md-2"></i>
                    <div class="text-md-end ps-3 ps-md-0 pe-md-3 order-md-1">
                        <h3 class="h6 text-light mb-1">Over 1 Million Listings</h3>
                        <p class="fs-sm text-light opacity-70 mb-0">That’s more than you’ll find on any other major online automotive marketplace in the USA.</p>
                    </div>
                </div>
                <div class="d-flex pb-4 pb-md-5 mb-2"><i class="fi-search lead text-primary mt-1 order-md-2"></i>
                    <div class="text-md-end ps-3 ps-md-0 pe-md-3 order-md-1">
                        <h3 class="h6 text-light mb-1">Personalized Search</h3>
                        <p class="fs-sm text-light opacity-70 mb-0">Our powerful search makes it easy to personalize your results so you only see the cars and features you care about.</p>
                    </div>
                </div>
                <div class="d-flex pb-4 pb-md-5 mb-2"><i class="fi-settings lead text-primary mt-1 order-md-2"></i>
                    <div class="text-md-end ps-3 ps-md-0 pe-md-3 order-md-1">
                        <h3 class="h6 text-light mb-1">Non-Stop Innovation</h3>
                        <p class="fs-sm text-light opacity-70 mb-0">Our team is constantly developing new features that make the process of buying and selling a car simpler.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-2 d-none d-md-block">
                <div class="position-relative mx-auto h-100" style="max-width: 5rem; min-height: 26rem;">
                    <div class="rellax content-overlay pt-5" data-rellax-percentage="0.5"><img class="pt-3 mt-5" :src="'/assets/img/car-finder/home/car.svg'" alt="Car"></div>
                    <div class="position-absolute top-0 start-50 translate-middle-x h-100 overflow-hidden"><img :src="'/assets/img/car-finder/home/road-line.svg'" width="2" alt="Road line"></div>
                </div>
            </div>
            <div class="col-md-5 col-lg-4 pt-md-5 mt-md-3">
                <div class="d-flex pb-4 pb-md-5 mb-2"><i class="fi-info-circle lead text-primary mt-1"></i>
                    <div class="ps-3">
                        <h3 class="h6 text-light mb-1">Valuable Insights</h3>
                        <p class="fs-sm text-light opacity-70 mb-0">We provide free access to key info like dealer reviews, market value, price drops.</p>
                    </div>
                </div>
                <div class="d-flex pb-4 pb-md-5 mb-2"><i class="fi-users lead text-primary mt-1"></i>
                    <div class="ps-3">
                        <h3 class="h6 text-light mb-1">Consumer-First Mentality</h3>
                        <p class="fs-sm text-light opacity-70 mb-0">We focus on building the most transparent, trustworthy experience for our users, and we’ve proven that works for dealers, too.</p>
                    </div>
                </div>
                <div class="d-flex pb-4 pb-md-5 mb-2"><i class="fi-calculator lead text-primary mt-1"></i>
                    <div class="ps-3">
                        <h3 class="h6 text-light mb-1">Online Car Appraisal</h3>
                        <p class="fs-sm text-light opacity-70 mb-0">Specify the parameters of your car to form its market value on the basis of similar cars on Finder.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>




</template>
<script setup>
import {ref, onMounted, computed,watch} from 'vue';
import axios from 'axios';
import {useRouter} from "vue-router";
const cars=ref([])
const marques=ref([])
const bodytypes=ref([])
const getcars=async()=>{
    await axios.get("http://localhost:8000/api/cars")
        .then(res=>{
            cars.value=res.data
            console.log(cars.value)
        })
        .catch(error=>{
            console.log(error)
        })
}

const getmarques=async()=>{
    await axios.get("http://localhost:8000/api/marques")
        .then(res=>{
            marques.value=res.data
            console.log(marques.value)
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

onMounted(() => {
    getcars();
    getmarques();
    getbodytypes();

});
</script>
