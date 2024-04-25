<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <h1 class="h2 text-light">Add Fuel Type</h1>
                <form class="needs-validation pb-4" @submit.prevent="addFuelType">

                    <div class="row mb-2">
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="account-password-new">Fuel Type</label>
                            <div class="password-toggle">
                                <input class="form-control form-control-light" type="text" id="fueltype" v-model="fuelType.fueltype">

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
const fuelType=ref({
    fueltype:"",

})
const addFuelType=async()=>{
    await
        axios.post("http://localhost:8000/api/fueltypes/",fuelType.value)
            .then(() => (

                router.push({ name: 'listFuelTypes' })
            ))
            .catch(err => console.log(err))

}
</script>
