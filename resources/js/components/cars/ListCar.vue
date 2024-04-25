<template>
    <div class="container mt-5 mb-md-4 py-5">
        <div class="row py-md-1">
            <!-- Filers sidebar (Offcanvas on mobile)-->
            <div class="col-lg-3 pe-xl-4">
                <div class="offcanvas-lg offcanvas-start bg-dark" id="filters-sidebar">
                    <div class="offcanvas-header bg-transparent d-flex d-lg-none align-items-center">
                        <h2 class="h5 text-light mb-0">Filters</h2>
                        <button class="btn-close btn-close-white" type="button" data-bs-dismiss="offcanvas" data-bs-target="#filters-sidebar"></button>
                    </div>
                    <div class="offcanvas-header bg-transparent d-block border-bottom border-light pt-0 pt-lg-4 px-lg-0">
                        <ul class="nav nav-tabs nav-tabs-light mb-0">
                            <li class="nav-item"><a class="nav-link" href="#">Search New</a></li>
                            <li class="nav-item"><a class="nav-link active" href="#">Search Used</a></li>
                        </ul>
                    </div>
                    <div class="offcanvas-body py-lg-4">

                        <div class="pb-4 mb-2">
                            <h3 class="h6 text-light">Location</h3>
                            <select class="form-select form-select-light mb-2" v-model="selectedCountry">
                                <option value="" disabled selected>Select location</option>
                                <option v-for="country in countries" :key="country.id" :value="country.id">{{ country.name }}</option>
                            </select>
                        </div>
                        <div class="pb-4 mb-2">
                            <h3 class="h6 text-light">Body Type</h3>
                            <div class="overflow-auto" data-simplebar data-simplebar-auto-hide="false" data-simplebar-inverse style="height: 11rem;">
                                <div v-for="bodytype in bodytypes" :key="bodytype.id" class="form-check form-check-light">
                                <input class="form-check-input" type="checkbox" :id="bodytype.name" v-model="selectedBodyTypes" :value="bodytype.id">
                                <label class="form-check-label fs-sm" :for="bodytype.name">{{ bodytype.car_type }}</label>
                                </div>
                            </div>
                        </div>
                        <div class="pb-4 mb-2">
                            <h3 class="h6 text-light pt-1">Year</h3>
                            <div class="d-flex align-items-center">

                                <select class="form-select form-select-light w-100" v-model="selectedYear">
                                    <option value="" disabled>To</option>
                                    <option value="2021">2021</option>
                                    <option value="2020">2020</option>
                                    <option value="2019">2019</option>
                                    <option value="2018">2018</option>
                                    <option value="2017">2017</option>
                                    <option value="2016">2016</option>
                                    <option value="2015">2015</option>
                                    <option value="2014">2014</option>
                                    <option value="2013">2013</option>
                                    <option value="2012">2012</option>
                                    <option value="2011">2011</option>
                                    <option value="2010">2010</option>
                                </select>
                            </div>
                        </div>
                        <div class="pb-4 mb-2">
                            <h3 class="h6 text-light">Make &amp; Model</h3>
                            <select class="form-select form-select-light mb-2" v-model="selectedMake" @change="getModelsByMake">
                                <option value="" disabled selected>Any make</option>
                                <option v-for="make in marques" :key="make.id" :value="make.id">{{ make.name }}</option>
                                </select>
                                <select class="form-select form-select-light mb-1" v-model="selectedModel">
                                <option value="" disabled selected>Any model</option>
                                <option v-for="model in models" :key="model.id" :value="model.id">{{ model.model_name }}</option>
                                </select>
                        </div>
                       <!--  <div class="pb-4 mb-2">
                            <h3 class="h6 text-light">Price</h3>
                            <div class="range-slider range-slider-light mb-3" data-start-min="25000" data-start-max="65000" data-min="4000" data-max="100000" data-step="1000">
                                <div class="range-slider-ui"></div>
                                <div class="d-flex align-items-center">
                                    <div class="w-50 pe-2">
                                        <input class="form-control form-control-light range-slider-value-min" type="text">
                                    </div>
                                    <div class="text-muted">&mdash;</div>
                                    <div class="w-50 ps-2">
                                        <input class="form-control form-control-light range-slider-value-max" type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="form-check form-switch form-switch-light">
                                <input class="form-check-input" type="checkbox" id="negotiated-price">
                                <label class="form-check-label fs-sm" for="negotiated-price">Negotiated price</label>
                            </div>
                        </div> -->

                        <div class="pb-4 mb-2">
                            <h3 class="h6 text-light">Fuel Type</h3>
                            <div v-for="fueltype in fueltypes" :key="fueltype.id" class="form-check form-check-light">
                            <input class="form-check-input" type="checkbox" :id="fueltype.name" v-model="selectedFuelTypes" :value="fueltype.id">
                            <label class="form-check-label fs-sm" :for="fueltype.name">{{ fueltype.fueltype }}</label>
                            </div>
                        </div>
                        <div class="pb-4 mb-1">
                            <h3 class="h6 text-light">Transmission</h3>
                            <div class="form-check form-check-light">
                                <input class="form-check-input" type="checkbox" id="auto">
                                <label class="form-check-label fs-sm" for="auto">Automatic</label>
                            </div>
                            <div class="form-check form-check-light">
                                <input class="form-check-input" type="checkbox" id="manual">
                                <label class="form-check-label fs-sm" for="manual">Manual</label>
                            </div>
                        </div>
                        <div class="pb-4 mb-2">
                            <h3 class="h6 text-light pt-1">Mileage</h3>
                            <div class="d-flex align-items-center">
                                <input v-model="mileageRange.from" class="form-control form-control-light w-100" type="number" min="0" step="500" placeholder="From">
                                <div class="mx-2">&mdash;</div>
                                <input v-model="mileageRange.to" class="form-control form-control-light w-100" type="number" min="0" step="500" placeholder="To">
                            </div>
                            </div>


                        <button class="btn btn-primary" @click="filterCars">Filter Cars</button>
                        <button class="btn btn-light-primary mx-2" @click="getcars">cancel</button>
                    </div>
                </div>
            </div>
            <!-- Catalog list view-->
            <div class="col-lg-9">
                <!-- Breadcrumb-->
                <nav class="mb-3 pt-md-2 pt-lg-4" aria-label="Breadcrumb">
                    <ol class="breadcrumb breadcrumb-light">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Used cars</li>
                    </ol>
                </nav>
                <!-- Page title-->
                <div class="d-flex align-items-center justify-content-between pb-4 mb-2">
                    <h1 class="text-light me-3 mb-0">Used cars</h1>
                    <div class="text-light"><i class="fi-car fs-lg me-2"></i><span class="align-middle">{{cars.length }} offers</span></div>
                </div>
                <!-- Sorting + View-->
                <div class="d-sm-flex align-items-center justify-content-between pb-4 mb-2">
                    <div class="d-flex align-items-center me-sm-4">
                        <label class="fs-sm text-light me-2 pe-1 text-nowrap" for="sorting1"><i class="fi-arrows-sort mt-n1 me-2"></i>Sort by:</label>
                        <select class="form-select form-select-light form-select-sm me-sm-4" id="sorting1">
                            <option>Newest</option>
                            <option>Popular</option>
                            <option>Price: Low - High</option>
                            <option>Price: Hight - Low</option>
                        </select>
                        <div class="d-none d-md-block border-end border-light" style="height: 1.25rem;"></div>
                        <div class="d-none d-sm-block fw-bold text-light opacity-70 text-nowrap ps-md-4"><i class="fi-switch-horizontal me-2"></i><span class="align-middle">Compare (0)</span></div>
                    </div>
                    <div class="d-none d-sm-flex"><a class="nav-link nav-link-light px-2 active" href="" data-bs-toggle="tooltip" title="List view"><i class="fi-list"></i></a><a class="nav-link nav-link-light px-2" href="" data-bs-toggle="tooltip" title="Grid view"><i class="fi-grid"></i></a></div>
                </div>

                <!-- Item-->
                <div class="card card-light card-hover card-horizontal mb-4" v-for="md in paginatedcars" :key="md.id">

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
                <!-- Sorting + Pagination-->
                <div class="d-flex align-items-center justify-content-between py-2">
                    <div class="d-flex align-items-center me-sm-4">

                    </div>
                    <nav aria-label="Pagination">
                        <ul class="pagination pagination-light mb-0">
                            <li class="page-item d-sm-none">
                            <span class="page-link page-link-static">{{ currentPage }} / {{ totalPages }}</span>
                            </li>
                            <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous" @click.prevent="prevPage">
                                <i class="fi-chevron-left"></i>
                            </a>
                            </li>
                            <li v-for="page in totalPages" :key="page" class="page-item d-none d-sm-block" :class="{ 'active': currentPage === page }">
                            <a class="page-link" href="#" @click.prevent="setCurrentPage(page)">
                                {{ page }}
                            </a>
                            </li>
                            <li class="page-item d-none d-sm-block">...</li>
                            <li class="page-item d-none d-sm-block">
                            <a class="page-link" href="#" @click.prevent="setCurrentPage(totalPages)" :class="{ 'active': currentPage === totalPages }">
                                {{ totalPages }}
                            </a>
                            </li>
                            <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next" @click.prevent="nextPage">
                                <i class="fi-chevron-right"></i>
                            </a>
                            </li>
                        </ul>
                        </nav>
                </div>
            </div>
        </div>
    </div>



</template>

<script setup>
import {ref, onMounted, computed,watch} from 'vue';
import axios from 'axios';
import {useRouter} from "vue-router";
const bodytypes = ref([]);
const marques = ref([]);
const models = ref([]);
const fueltypes = ref([]);
const countries = ref([]);


const selectedCountry = ref("");
  const selectedBodyTypes = ref([]);
  const selectedYear = ref("");
  const selectedMake = ref("");
  const selectedModel = ref("");
  const selectedFuelTypes = ref([]);
  const selectedTransmission = ref({
    automatic: false,
    manual: false,
  });
  const mileageRange = ref({
    from: null,
    to: null,
  });



    const filterCars = async () => {
    try {
        console.log('Selected Filter Parameters:', {
            selectedCountry: selectedCountry.value,
            selectedBodyTypes: selectedBodyTypes.value,
            selectedYear: selectedYear.value,
            selectedMake: selectedMake.value,
            selectedModel: selectedModel.value,
            selectedFuelTypes: selectedFuelTypes.value,
            selectedTransmission: selectedTransmission.value,
            mileageRange: mileageRange.value,
        });

        const response = await axios.post('http://127.0.0.1:8000/api/filtercars', {
            selectedCountry: selectedCountry.value,
            selectedBodyTypes: selectedBodyTypes.value,
            selectedYear: selectedYear.value,
            selectedMake: selectedMake.value,
            selectedModel: selectedModel.value,
            selectedFuelTypes: selectedFuelTypes.value,
            selectedTransmission: selectedTransmission.value,
            mileageRange: mileageRange.value,
        }, {
    headers: {
        'Content-Type': 'application/json',
    },
});

        cars.value = response.data;
        console.log('Filtered Cars:', response.data);
    } catch (error) {
        console.error(error);
    }
};



const getcountries = async () => {
    try {
        const response = await axios.get('http://localhost:8000/api/countries');
        countries.value = response.data;
    } catch (error) {
        console.error(error);
    }
};

const getfueltypes=async()=>{
    await axios.get("http://localhost:8000/api/fueltypes")
        .then(res=>{
            fueltypes.value=res.data
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

const setCurrentPage = (page) => {
  currentPage.value = page;
};

const nextPage = () => {
  if (currentPage.value < totalPages.value) {
    currentPage.value++;
  }
};

const prevPage = () => {
  if (currentPage.value > 1) {
    currentPage.value--;
  }
};

const cars=ref([])
const router = useRouter();
const itemsPerPage = 3;
const currentPage = ref(1);

const paginatedcars = computed(() => {
    const start = (currentPage.value - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    return cars.value.slice(start, end);
});

const totalPages = computed(() => Math.ceil(cars.value.length / itemsPerPage));


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

onMounted(() => {
    getcars();
    getbodytypes();
    getmarques();
    getmodels();
    getfueltypes();
    getcountries();
});


const deletemodel=async(id)=>{
    if (window.confirm("Etes-vous sûr de vouloir supprimer ?")) {
        try {
            await axios.delete(`http://localhost:8000/api/cars/${id}`)
            getcars()
        } catch (error) {
            console.log(error)
        }
    }}



const showcar = (id) => {
    router.push({ name: 'showcar', params: { id } });
};

</script>

