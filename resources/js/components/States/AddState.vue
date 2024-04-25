<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <h1 class="h2 text-light">Add State</h1>
                <form class="needs-validation pb-4" @submit.prevent="addState">

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
const state=ref({
    name:"",
    country_id:""
})
const addState=async()=>{
    await
        axios.post("http://localhost:8000/api/states/",state.value)
            .then(() => (

                router.push({ name: 'listStates' })
            ))
            .catch(err => console.log(err))

}

const countries = ref([]);
const getcountries = () => {

    axios.get('http://localhost:8000/api/countries').then(res => {
        countries.value = res.data;
    }).catch(error => {
        console.log(error)
    });
}

onMounted(() => {
    getcountries();
})
</script>

