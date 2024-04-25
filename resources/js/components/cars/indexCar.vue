<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <!-- Breadcrumb-->
        <nav class="mb-4 pt-md-3" aria-label="Breadcrumb">
            <ol class="breadcrumb breadcrumb-light">
                <li class="breadcrumb-item"><a href="">Home</a></li>
                <li class="breadcrumb-item"><a href="">Account</a></li>
                <li class="breadcrumb-item active" aria-current="page">My Cars</li>
            </ol>
        </nav>
        <!-- Page content-->
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <h1 class="h2 text-light mb-0">My Cars</h1><a class="nav-link-light fw-bold" href="#"><i class="fi-trash mt-n1 me-2"></i>Delete all</a>
                </div>

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
                        <div class="dropdown position-absolute zindex-5 top-0 end-0 mt-3 me-3">
                            <button class="btn btn-icon btn-translucent-light btn-xs rounded-circle" type="button" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
                            <ul class="dropdown-menu dropdown-menu-dark my-1" aria-labelledby="contextMenu1">
                                <li>
                                    <button class="dropdown-item" type="button"><i class="fi-edit me-2"></i>Edit</button>
                                </li>
                                <li>
                                    <button class="dropdown-item" type="button"><i class="fi-trash me-2"></i>Delete</button>
                                </li>
                            </ul>
                        </div>
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

const auth_user = ref({
    id:"",
});
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
import {ref, onMounted, computed} from 'vue';
import axios from 'axios';
import {useRouter} from "vue-router";
const cars=ref([])
const router = useRouter();
const itemsPerPage = 3;
const currentPage = ref(1);
var user_id=null ;
const paginatedcars = computed(() => {
    const start = (currentPage.value - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    return cars.value.slice(start, end);
});

const totalPages = computed(() => Math.ceil(cars.value.length / itemsPerPage));

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
           user_id = auth_user.value.id;
            console.log(auth_user);
            console.log("ggg",auth_user.value.id);
            getcars(user_id);
        } else {
            console.error('Invalid response structure:', response.data);
        }
    } catch (error) {
        console.error('Error fetching authenticated user:', error);
    }
}


const getcars=async(user_id)=>{
    await axios.get(`http://localhost:8000/api/getusercars/${user_id}`)
        .then(res=>{
            cars.value=res.data
            console.log(cars.value)
        })
        .catch(error=>{
            console.log(error)
        })
}
onMounted(() => {
    getUser();
  

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

const navigateToEditModel = (id) => {
    router.push({ name: 'editModel', params: { id } });
};

const showcar = (id) => {
    router.push({ name: 'showcar', params: { id } });
};

</script>

