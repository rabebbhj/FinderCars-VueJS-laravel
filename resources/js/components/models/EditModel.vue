<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <h1 class="h2 text-light">Edit State</h1>
                <form class="needs-validation pb-4" @submit.prevent="modifiermodel">

                    <div class="row mb-2">
                        <div class="col-sm-12 mb-3">
                            <label class="form-label text-light" for="account-password-new">Name</label>
                            <div class="password-toggle">
                                <input class="form-control form-control-light" type="text" id="model_name" v-model="model.model_name">

                            </div>
                        </div>
                     
                       
                        <div class="col-sm-12 mb-3">
                            <label class="form-label text-light" for="sc-state">Marque <span class="text-danger">*</span></label>
                            <select class="form-select form-select-light" v-model="model.marque_id">
                                <option v-for="mq in marques" :key="mq.id" :value=mq.id>{{ mq.name }}</option>
                            </select>
                        </div>
                    </div>
                    <button class="btn btn-outline-primary" type="submit">Update</button>
                </form>
            </div>
        </div>
    </div>

</template>
<script setup>

import {ref ,onMounted} from "vue";
import axios from 'axios';
import {useRoute, useRouter} from "vue-router";

const model = ref({});
const route = useRoute();
const router = useRouter();
const fetchModel = async () => {
    await axios.get(`http://localhost:8000/api/models/${route.params.id}`).then((res)=> {

        model.value = res.data;
    })
        .catch((err) => { console.error(err) })
}

onMounted(() => {
    fetchModel();
    getmarques();
});

const marques = ref([]);
const getmarques = () => {

    axios.get('http://localhost:8000/api/marques').then(res => {
        marques.value = res.data;
    }).catch(error => {
        console.log(error)
    });
}

const modifiermodel = () => {
    axios.put(`http://localhost:8000/api/models/${route.params.id}`, model
        .value)

        .then(() => {
            router.push('/listModels')
        })
        .catch(error => {
            console.error("There was an error!", error);
        })

}
</script>

