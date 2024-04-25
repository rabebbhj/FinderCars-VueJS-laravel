<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <h1 class="h2 text-light mb-0">Marques</h1><a class="nav-link-light fw-bold" href="/addMarque"><i class="fi-plus mt-n1 me-2"></i>Add</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-dark">
                        <thead>
                        <tr>

                            <th>Name</th>
                            <th>Slug</th>
                            <th>Image</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="mq in paginatedMarques" :key="mq.id">

                            <td>{{ mq.name }}</td>
                            <td>{{ mq.slug }}</td>
                            <td><img :src="mq.marque_image" width="70" height="80"/></td>
                            <td>

                                <button class="btn btn-icon btn-translucent-light btn-xs rounded-circle" type="button" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
                                <ul class="dropdown-menu dropdown-menu-dark my-1" aria-labelledby="contextMenu1">
                                    <li>


                                        <button @click="navigateToEditMarque(mq.id)" class="dropdown-item">
                                            <i class="fi-edit me-2"></i>Edit
                                        </button>                                    </li>
                                    <li>
                                        <button class="dropdown-item" type="button" @click="deletemarque(mq.id)"><i class="fi-trash me-2" ></i>Delete</button>
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
const marques=ref([])
const router = useRouter();
const itemsPerPage = 2;
const currentPage = ref(1);

const paginatedMarques = computed(() => {
    const start = (currentPage.value - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    return marques.value.slice(start, end);
});

const totalPages = computed(() => Math.ceil(marques.value.length / itemsPerPage));


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
onMounted(() => {
    getmarques();
});


const deletemarque=async(id)=>{
    if (window.confirm("Etes-vous sûr de vouloir supprimer ?")) {
    try {
        await axios.delete(`http://localhost:8000/api/marques/${id}`)
        getmarques()
    } catch (error) {
        console.log(error)
    }
}}

const navigateToEditMarque = (id) => {
    router.push({ name: 'editMarque', params: { id } });
};



</script>
