<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <h1 class="h2 text-light">Edit Country</h1>
                <form class="needs-validation pb-4" @submit.prevent="modifierCountry">

                    <div class="row mb-2">
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="account-password-new">Name</label>
                            <div class="password-toggle">
                                <input class="form-control form-control-light" type="text" id="fueltype" v-model="country.name">

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

const country = ref({});
const route = useRoute();
const router = useRouter();
const fetchCountry = async () => {
    await axios.get(`http://localhost:8000/api/countries/${route.params.id}`).then((res)=> {
        country.value = res.data;
        })
            .catch((err) => { console.error(err) })
}

onMounted(() => {
    fetchCountry();
});

const modifierCountry = () => {
    axios.put(`http://localhost:8000/api/countries/${route.params.id}`, country
        .value)

        .then(() => {
            router.push('/listCountries')
        })
        .catch(error => {
            console.error("There was an error!", error);
        })

}
</script>
