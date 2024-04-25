<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <h1 class="h2 text-light">Add Engine</h1>
                <form class="needs-validation pb-4" @submit.prevent="addEngine">

                    <div class="row mb-2">
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light" for="account-password-new">Engine Type</label>
                            <div class="password-toggle">
                                <input class="form-control form-control-light" type="text" id="engine_type" v-model="engine.engine_type">

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
const engine=ref({
    engine_type:"",

})
const addEngine=async()=>{
    await
        axios.post("http://localhost:8000/api/engines/",engine.value)
            .then(() => (

                router.push({ name: 'listEngines' })
            ))
            .catch(err => console.log(err))

}
</script>
