<template>
    <aside class="col-lg-4 col-md-5 pe-xl-4 mb-5">
        <!-- Account nav-->
        <div class="card card-body card-light border-0 shadow-sm pb-1 me-lg-1">
            <div class="d-flex d-md-block d-lg-flex align-items-start pt-lg-2 mb-4"><img class="rounded-circle" :src="'/assets/img/avatars/01.jpg'" width="48" alt="Robert Fox">
                <div class="pt-md-2 pt-lg-0 ps-3 ps-md-0 ps-lg-3">
                    <h2 class="fs-lg text-light mb-0" v-if="auth_user">{{ auth_user.name }}</h2>
                    <h2 v-else class="fs-lg text-light mb-0">Loading...</h2>
                    <!-- Display user email if available, otherwise show nothing -->
                    <ul class="list-unstyled fs-sm mt-3 mb-0" v-if="auth_user">
                        <li>
                            <a class="nav-link-light fw-normal" :href="'mailto:' + auth_user.email">
                                <i class="fi-mail opacity-60 me-2"></i>{{ auth_user.email }}
                            </a>
                        </li>
                    </ul>
                </div>
            </div><a class="btn btn-primary btn-lg w-100 mb-3" href="/addCar"><i class="fi-plus me-2"></i>Sell car</a><a class="btn btn-outline-light d-block d-md-none w-100 mb-3" href="#account-nav" data-bs-toggle="collapse"><i class="fi-align-justify me-2"></i>Menu</a>
            <div class="collapse d-md-block mt-3" id="account-nav">
                <div v-if="auth_user !== null && auth_user !== undefined" class="card-nav">
                        <a class="card-nav-link" href="/dashboard"><i class="fi-user me-2"></i>Personal Info</a>
                        
                        <template v-if="auth_user.is_admin == 1">
                            <a class="card-nav-link" href="/listMarques"><i class="fi-header me-2"></i> Marques</a>
                            <a class="card-nav-link" href="/listModels"><i class="fi-folder me-2"></i> Models</a>
                            <a class="card-nav-link" href="/listBodyTypes"><i class="fi-car me-2"></i> Body Types</a>
                            <a class="card-nav-link" href="/listFuelTypes"><i class="fi-car me-2"></i> Fuel Types</a>
                            <a class="card-nav-link" href="/listCountries"><i class="fi-map-pin me-2"></i> Countries</a>
                            <a class="card-nav-link" href="/listStates"><i class="fi-folder me-2"></i> States</a>
                            <a class="card-nav-link" href="/listEngines"><i class="fi-header me-2"></i> Engines</a>
                            <a class="card-nav-link" href="/listContacts"><i class="fi-chat-circle me-2"></i>My Contacts</a>
                        </template>

                        <a class="card-nav-link" href="/cars"><i class="fi-car me-2"></i>My Cars</a>
                        <a class="card-nav-link" @click="logout"><i class="fi-logout me-2"></i>Sign Out</a>

                       
                </div>
                    
                <div v-else class="d-flex justify-content-center align-items-center">
                    <div class="spinner-border mb-4" role="status">
                        
                    </div><span class="mx-4 mb-4">Loading...</span>
                </div>

            </div>
        </div>
    </aside>

</template>


<script setup>
import {ref,onMounted } from 'vue';
import axios from 'axios';
import {useRouter} from "vue-router";
const router = useRouter()

const auth_user = ref(null);
const getUser = async () => {
    try {
        let token = localStorage.getItem('token');
        const response = await axios.get("http://localhost:8000/api/user", {
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });

        // Check if the response has the expected structure
        if (response.data) {
            auth_user.value = response.data;
            console.log(auth_user.value);
        } else {
            console.error('Invalid response structure:', response.data);
        }
    } catch (error) {
        console.error('Error fetching authenticated user:', error);
    }
}

const logout = async () => {
    try {
        let token = localStorage.getItem('token');

        // Check if the token is present
        if (!token) {
            console.log("No token found. Already logged out.");
            return;
        }

        console.log(token);

        await axios.post('http://localhost:8000/api/logout', null, {
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });

        console.log("Logout successful");
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        await router.push("/login");
    } catch (error) {
        console.error("Logout failed:", error);
        alert("Logout failed. Please try again.");
    }
};



onMounted(() => {
    getUser();
});
</script>
