<template>
    <main class="page-wrapper">
        <!-- Page content-->
        <div class="container-fluid d-flex h-100 align-items-center justify-content-center py-4 py-sm-5">
            <div class="card card-body" style="max-width: 940px"><a class="position-absolute top-0 end-0 nav-link fs-sm py-1 px-2 mt-3 me-3" href="#" onclick="window.history.go(-1); return false;"><i class="fi-arrow-long-left fs-base me-2"></i>Go back</a>
                <div class="row mx-0 align-items-center">
                    <div class="col-md-6 border-end-md p-2 p-sm-5">
                        <h2 class="h3 mb-4 mb-sm-5">Register</h2>
                        <img class="d-block mx-auto" :src="'/assets/img/signin-modal/signup.svg'" width="344" alt="Illustartion">
                        <div class="mt-sm-4 pt-md-3">Already have an account? <a href="/login">Sign in</a></div>
                    </div>
                    <div class="col-md-6 px-2 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5">
                        <form @submit.prevent="handleSubmit">
                            <div class="mb-4">
                                <label class="form-label" for="signup-name">Full name</label>
                                <input id="name" type="text" class="form-control" v-model="user.name" required autofocus autocomplete="off" placeholder="Full name">                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="signup-email">Email address</label>
                                <input id="email" type="email" class="form-control" v-model="user.email" required autofocus autocomplete="off" placeholder="Email address">
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="signup-password">Password <span class='fs-sm text-muted'>min. 8 char</span></label>
                                <div class="password-toggle">
                                    <input id="password" type="password" class="form-control" v-model="user.password" required autocomplete="off" placeholder="Password">
                                    <label class="password-toggle-btn" aria-label="Show/hide password">
                                        <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                                    </label>
                                </div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="signup-password-confirm">Confirm password</label>
                                <div class="password-toggle">
                                    <input id="password_confirmation" type="password" class="form-control" v-model="user.password_confirmation" required autocomplete="off" placeholder="Confirm password">
                                    <label class="password-toggle-btn" aria-label="Show/hide password">
                                        <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                                    </label>
                                </div>
                            </div>

                            <button class="btn btn-primary btn-lg w-100" type="submit">Sign up         </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
</template>
<script setup>
import axios from "axios"
import { useRouter } from 'vue-router';
const router = useRouter()
let user = {
    name: '',
    email: '',
    password: '',
    password_confirmation: ''
}


const handleSubmit = async () => {

    axios.post('http://localhost:8000/api/register/', user)

        .then(response => {
            console.log(response)
            router.replace({ name: 'login' })
        })
        .catch(err => { console.log(err); alert(err) })

}
</script>
<style scoped>
.page-wrapper{
    margin-top: 50px;
}
</style>
