<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <h1 class="h2 text-light">Personal Info</h1>
                <div class="row pt-2">
                    <div class="col-lg-9 col-md-12 col-sm-8 mb-2 mb-m-4">
                        <div class="border border-light rounded-3 p-3 mb-4" id="personal-info">
                            <!-- Name-->
                            <div class="border-bottom border-light pb-3 mb-3">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="pe-2 opacity-70">
                                        <label class="form-label fw-bold text-light">Full name</label>
                                        <div class="text-light" id="name-value">{{ auth_user?.name }}</div>
                                    </div>
                                </div>

                            </div>


                            <!-- Email-->
                            <div class="border-bottom border-light pb-3 mb-3">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="pe-2 opacity-70">
                                        <label class="form-label fw-bold text-light">Email</label>
                                        <div class="text-light" id="email-value">{{ auth_user?.email }}</div>                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import {ref,onMounted } from 'vue';
import axios from 'axios';

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
};

onMounted(() => {
    getUser();
});
</script>
