<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <h1 class="h2 text-light">Edit Fuel Type</h1>
                <form class="needs-validation pb-4" @submit.prevent="modifierfueltype">

                    <div class="row mb-2">
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="account-password-new">Fuel Type</label>
                            <div class="password-toggle">
                                <input class="form-control form-control-light" type="text" id="fueltype" v-model="fueltype.fueltype">

                            </div>
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

const fueltype = ref({});
const route = useRoute();
const router = useRouter();
const fetchFueltype = async () => {
    await axios.get(`http://localhost:8000/api/fueltypes/${route.params.id}`).then((res)=> {
        fueltype.value = res.data;
        })
            .catch((err) => { console.error(err) })
}

onMounted(() => {
    fetchFueltype();
});

const modifierfueltype = () => {
    axios.put(`http://localhost:8000/api/fueltypes/${route.params.id}`, fueltype
        .value)

        .then(() => {
            router.push('/listFuelTypes')
        })
        .catch(error => {
            console.error("There was an error!", error);
        })

}
</script>
