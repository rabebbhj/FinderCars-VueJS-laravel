<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <h1 class="h2 text-light mb-0">Contacts</h1>
                </div>
                <div class="table-responsive">
                    <table class="table table-dark">
                        <thead>
                        <tr>

                            <th>Name </th>
                            <th>Email </th>
                            <th>Message</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="con in paginatedContacts" :key="con.id">

                            <td>{{ con.name }}</td>
                            <td>{{ con.email }}</td>
                            <td>{{ con.message }}</td>



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
const contacts=ref([])
const router = useRouter();

const itemsPerPage = 3;
const currentPage = ref(1);

const paginatedContacts = computed(() => {
    const start = (currentPage.value - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    return contacts.value.slice(start, end);
});

const totalPages = computed(() => Math.ceil(contacts.value.length / itemsPerPage));

const setCurrentPage = (page) => {
    currentPage.value = page;
};

const getcontacts=async()=>{
    await axios.get("http://localhost:8000/api/contacts")
        .then(res=>{
            contacts.value=res.data
        })
        .catch(error=>{
            console.log(error)
        })
}
onMounted(() => {
    getcontacts();
});





</script>
