<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <h1 class="h2 text-light mb-0">Models</h1><a class="nav-link-light fw-bold" href="/addModel"><i class="fi-plus mt-n1 me-2"></i>Add</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-dark">
                        <thead>
                        <tr>

                            <th>Name</th>
                            <th>Marque</th>
                          
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="md in paginatedModels" :key="md.id">

                            <td>{{ md.model_name }}</td>
                            <td>{{ md.marque.name }}</td>

                            <td>

                                <button class="btn btn-icon btn-translucent-light btn-xs rounded-circle" type="button" id="contextMenu1" data-bs-toggle="dropdown" aria-expanded="false"><i class="fi-dots-vertical"></i></button>
                                <ul class="dropdown-menu dropdown-menu-dark my-1" aria-labelledby="contextMenu1">
                                    <li>


                                        <button @click="navigateToEditModel(md.id)" class="dropdown-item">
                                            <i class="fi-edit me-2"></i>Edit
                                        </button>                                    </li>
                                    <li>
                                        <button class="dropdown-item" type="button" @click="deletemodel(md.id)"><i class="fi-trash me-2" ></i>Delete</button>
                                    </li>
                                </ul>

                            </td>
                        </tr>
                        </tbody>
                    </table>
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
const models=ref([])
const router = useRouter();
const itemsPerPage = 3;
const currentPage = ref(1);

const paginatedModels = computed(() => {
    const start = (currentPage.value - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    return models.value.slice(start, end);
});

const totalPages = computed(() => Math.ceil(models.value.length / itemsPerPage));


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
    getmodels();
});


const deletemodel=async(id)=>{
    if (window.confirm("Etes-vous sûr de vouloir supprimer ?")) {
        try {
            await axios.delete(`http://localhost:8000/api/models/${id}`)
            getmodels()
        } catch (error) {
            console.log(error)
        }
    }}

const navigateToEditModel = (id) => {
    router.push({ name: 'editModel', params: { id } });
};

</script>

