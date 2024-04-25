<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <h1 class="h2 text-light mb-0">Engines</h1><a class="nav-link-light fw-bold" href="/addEngine"><i class="fi-plus mt-n1 me-2"></i>Add</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-dark">
                        <thead>
                        <tr>

                            <th>Engine Type </th>

                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="eg in paginatedEngines" :key="eg.id">

                            <td>{{ eg.engine_type }}</td>


                            <td>

                                <button class="btn btn-icon btn-translucent-light btn-xs rounded-circle" type="button" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
                                <ul class="dropdown-menu dropdown-menu-dark my-1" aria-labelledby="contextMenu1">
                                    <li>


                                        <button @click="navigateToEditEngine(eg.id)" class="dropdown-item">
                                            <i class="fi-edit me-2"></i>Edit
                                        </button>                                    </li>
                                    <li>
                                        <button class="dropdown-item" type="button" @click="deleteEngine(eg.id)"><i class="fi-trash me-2" ></i>Delete</button>
                                    </li>
                                </ul>

                            </td>
                        </tr>



                        </tbody>
                    </table>
                </div>
                <div class="d-flex align-items-center justify-content-between py-2">
                    <div class="d-flex align-items-center me-sm-4"></div>
                    <nav aria-label="Pagination">
                        <ul class="pagination pagination-light mb-0">
                            <li class="page-item" v-for="page in totalPages" :key="page">
                                <a
                                    class="page-link"
                                    href="#"
                                    @click.prevent="setCurrentPage(page)"
                                    :class="{ 'active': currentPage === page }"
                                >
                                    {{ page }}
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

import {ref, onMounted, computed} from 'vue';
import axios from 'axios';
import {useRouter} from "vue-router";
const engines=ref([])
const router = useRouter();


const itemsPerPage = 3;
const currentPage = ref(1);

const paginatedEngines = computed(() => {
    const start = (currentPage.value - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    return engines.value.slice(start, end);
});

const totalPages = computed(() => Math.ceil(engines.value.length / itemsPerPage));

const setCurrentPage = (page) => {
    currentPage.value = page;
};

const getengines=async()=>{
    await axios.get("http://localhost:8000/api/engines")
        .then(res=>{
            engines.value=res.data
        })
        .catch(error=>{
            console.log(error)
        })
}
onMounted(() => {
    getengines();
});


const deleteEngine=async(id)=>{
    if (window.confirm("Etes-vous sûr de vouloir supprimer ?")) {
    try {
        await axios.delete(`http://localhost:8000/api/engines/${id}`)
        getengines()
    } catch (error) {
        console.log(error)
    }
}}

const navigateToEditEngine = (id) => {
    router.push({ name: 'editEngine', params: { id } });
};

</script>
