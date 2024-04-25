<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <h1 class="h2 text-light">Edit State</h1>
                <form class="needs-validation pb-4" @submit.prevent="modifierstate">

                    <div class="row mb-2">
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="account-password-new">Name</label>
                            <div class="password-toggle">
                                <input class="form-control form-control-light" type="text" id="model_name" v-model="state.name">

                            </div>
                        </div>


                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="sc-state">Country <span class="text-danger">*</span></label>
                            <select class="form-select form-select-light" v-model="state.country_id">
                                <option v-for="cou in countries" :key="cou.id" :value=cou.id>{{ cou.name }}</option>
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

const state = ref({});
const route = useRoute();
const router = useRouter();
const fetchState = async () => {
    await axios.get(`http://localhost:8000/api/states/${route.params.id}`).then((res)=> {

        state.value = res.data;
    })
        .catch((err) => { console.error(err) })
}

onMounted(() => {
    fetchState();
    getcountries();
});

const countries = ref([]);
const getcountries = () => {

    axios.get('http://localhost:8000/api/countries').then(res => {
        countries.value = res.data;
    }).catch(error => {
        console.log(error)
    });
}

const modifierstate = () => {
    axios.put(`http://localhost:8000/api/states/${route.params.id}`, state
        .value)

        .then(() => {
            router.push('/listStates')
        })
        .catch(error => {
            console.error("There was an error!", error);
        })

}
</script>

