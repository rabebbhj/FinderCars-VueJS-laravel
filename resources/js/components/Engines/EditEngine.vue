<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <h1 class="h2 text-light">Edit Engine </h1>
                <form class="needs-validation pb-4" @submit.prevent="modifierengine">

                    <div class="row mb-2">
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="account-password-new">Engine Type</label>
                            <div class="password-toggle">
                                <input class="form-control form-control-light" type="text" id="engine_type" v-model="engine.engine_type">

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

const engine = ref({});
const route = useRoute();
const router = useRouter();
const fetchEngine = async () => {
    await axios.get(`http://localhost:8000/api/engines/${route.params.id}`).then((res)=> {
        engine.value = res.data;
        })
            .catch((err) => { console.error(err) })
}

onMounted(() => {
    fetchEngine();
});

const modifierengine = () => {
    axios.put(`http://localhost:8000/api/engines/${route.params.id}`, engine
        .value)

        .then(() => {
            router.push('/listEngines')
        })
        .catch(error => {
            console.error("There was an error!", error);
        })

}
</script>
