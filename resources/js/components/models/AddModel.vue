<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <h1 class="h2 text-light">Add Model</h1>
                <form class="needs-validation pb-4" @submit.prevent="addModel">

                    <div class="row mb-2">
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="account-password-new">Name</label>
                            <div class="password-toggle">
                                <input class="form-control form-control-light" type="text" id="model_name" v-model="model.model_name">

                            </div>
                        </div>
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="account-password-confirm">Slug</label>
                            <div class="password-toggle">
                                <input class="form-control form-control-light" type="text" id="model_slug" v-model="model.model_slug" >

                            </div>
                        </div>
                      
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="sc-state">Marque <span class="text-danger">*</span></label>
                            <select class="form-select form-select-light" v-model="model.marque_id">
                                <option v-for="mq in marques" :key="mq.id" :value=mq.id>{{ mq.name }}</option>
                            </select>
                        </div>
                    </div>
                    <button class="btn btn-outline-primary" type="submit">Save</button>
                </form>
            </div>
        </div>
    </div>

</template>
<script setup>
import {onMounted, ref} from "vue"
import { useRouter } from 'vue-router';
const router = useRouter()
import axios from 'axios';
const model=ref({
    model_name:"",
    model_slug:"",
    marque_id:""
})
const addModel=async()=>{
    await
        axios.post("http://localhost:8000/api/models/",model.value)
            .then(() => (

                router.push({ name: 'listModels' })
            ))
            .catch(err => console.log(err))

}

const marques = ref([]);
const getmarques = () => {

    axios.get('http://localhost:8000/api/marques').then(res => {
        marques.value = res.data;
    }).catch(error => {
        console.log(error)
    });
}

onMounted(() => {
    getmarques();
})
</script>

