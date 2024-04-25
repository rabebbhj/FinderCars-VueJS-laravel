<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <h1 class="h2 text-light">Add Country</h1>
                <form class="needs-validation pb-4" @submit.prevent="addCountry">

                    <div class="row mb-2">
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="account-password-new">Name</label>
                            <div class="password-toggle">
                                <input class="form-control form-control-light" type="text" id="fueltype" v-model="country.name">

                            </div>
                        </div>


                    </div>
                    <button class="btn btn-outline-primary" type="submit">Save</button>
                </form>
            </div>
        </div>
    </div>

</template>
<script setup>
import { ref } from "vue"
import { useRouter } from 'vue-router';
const router = useRouter()
import axios from 'axios';
const country=ref({
    name:"",

})
const addCountry=async()=>{
    await
        axios.post("http://localhost:8000/api/countries/",country.value)
            .then(() => (

                router.push({ name: 'listCountries' })
            ))
            .catch(err => console.log(err))

}
</script>
