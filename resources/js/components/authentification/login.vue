<template>
    <main class="page-wrapper">
        <!-- Page content-->
        <div class="container-fluid d-flex h-100 align-items-center justify-content-center py-4 py-sm-5">
            <div class="card card-body" style="max-width: 940px"><a class="position-absolute top-0 end-0 nav-link fs-sm py-1 px-2 mt-3 me-3" href="#" onclick="window.history.go(-1); return false;"><i class="fi-arrow-long-left fs-base me-2"></i>Go back</a>
                <div class="row mx-0 align-items-center">
                    <div class="col-md-6 border-end-md p-2 p-sm-5">
                        <h2 class="h3 mb-4 mb-sm-5">Login</h2><img class="d-block mx-auto" :src="'assets/img/signin-modal/signin.svg'" width="344" alt="Illustartion">
                        <div class="mt-4 mt-sm-5">Don't have an account?
                            <a href="/register">Sign up here</a>
                        </div>
                    </div>
                    <div class="col-md-6 px-2 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5">

                        <form  @submit.prevent="handleLogin" >
                            <div class="mb-4">
                                <label class="form-label mb-2" for="signin-email">Email address</label>
                                <input id="email" type="email" class="form-control" v-model="user.email" required
                                       autofocus autocomplete="off" placeholder="Email">
                            </div>
                            <div class="mb-4">
                                <div class="d-flex align-items-center justify-content-between mb-2">
                                    <label class="form-label mb-0" for="signin-password">Password</label>
                                </div>
                                <div class="password-toggle">
                                    <input id="password" type="password" class="form-control" v-model="user.password"
                                           required autocomplete="off" placeholder="Password">
                                    <label class="password-toggle-btn" aria-label="Show/hide password">
                                        <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                                    </label>
                                </div>
                            </div>
                            <button class="btn btn-primary btn-lg w-100" type="submit">Sign in</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
</template>
<script setup>
import axios from 'axios';
import { useRouter } from 'vue-router';
const router = useRouter()
let user = {}
const handleLogin = async () => {
    axios.post('http://localhost:8000/api/login/', user)

        .then((response) => {
            router.push("/dashboard").then(() => {
                window.location.reload();
            });
            localStorage.setItem('user', response.data.user.name)
            localStorage.setItem('token', response.data.token)
        })
        .catch(err => {
            console.log(err);
            alert(err)
        })

}
</script>
<style scoped>
.page-wrapper{
    margin-top: 50px;
}
</style>





