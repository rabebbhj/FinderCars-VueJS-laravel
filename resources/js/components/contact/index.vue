<template>
    <section class="container my-5 pt-5 pb-lg-5">
        <!-- Breadcrumb-->
        <nav class="mb-4 pt-md-3" aria-label="Breadcrumb">
            <ol class="breadcrumb breadcrumb-light">
                <li class="breadcrumb-item"><a href="">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Contact us</li>
            </ol>
        </nav>
        <div class="row gy-4">
            <div class="col-lg-4 col-md-6">
                <div class="mb-md-5 mb-4 pb-md-4">
                    <h1 class="mb-md-4 text-light">Contact us</h1>
                    <p class="mb-0 fs-lg text-light opacity-70">Fill out the form and out team will try to get back to you within 24 hours.</p>
                </div>
                <div class="d-flex align-items-start mb-4 pb-md-3"><img class="me-3 flex-shrink-0" :src="'/assets/img/car-finder/icons/envelope.svg'" width="32" alt="Envelope icon">
                    <div>
                        <h3 class="h6 mb-2 pb-1 text-light">General communication</h3>
                        <p class="mb-0 text-light"><span class="opacity-70">For general queries, including partnership opportunities, please email</span><a class="ms-1 text-nowrap" href="mailto:example@email.com">example@email.com</a></p>
                    </div>
                </div>
                <div class="d-flex align-items-start mb-4 pb-md-3"><img class="me-3 flex-shrink-0" :src="'assets/img/car-finder/icons/chat.svg'" width="32" alt="Chat icon">
                    <div>
                        <h3 class="h6 mb-2 pb-1 text-light">General communication</h3>
                        <p class="mb-0 text-light"><span class="opacity-70">We’re here to help! If you have technical issues</span><a class="ms-1 text-nowrap" href="">contact support</a></p>
                    </div>
                </div>
                <div class="d-flex align-items-start mb-4 pb-md-3"><img class="me-3 flex-shrink-0" :src="'assets/img/car-finder/icons/map-pin.svg'" width="32" alt="Map pin icon">
                    <div>
                        <h3 class="h6 mb-2 pb-1 text-light">Our headquarters</h3>
                        <p class="mb-0 text-light"><span class="opacity-70">8502 Preston Rd. Inglewood, Maine 98380</span><a class="ms-1 text-nowrap" href="" data-scroll>get directions</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 offset-lg-2">
                <!-- Contact form-->
                <form class="needs-validation" @submit.prevent="addContact">
                    <div class="mb-4">
                        <label class="form-label text-light" for="c-name">Full Name</label>
                        <input class="form-control form-control-lg form-control-light" id="name" type="text"  v-model="contact.name">
                        <div class="invalid-feedback">Please, enter your name</div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label text-light" for="c-email">Your Email</label>
                        <input class="form-control form-control-lg form-control-light" id="email" type="email"  v-model="contact.email">
                        <div class="invalid-feedback">Please, enter your email</div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label text-light" for="c-message">Message</label>
                        <textarea class="form-control form-control-lg form-control-light" id="message" rows="4" placeholder="Leave your message"  v-model="contact.message"></textarea>
                        <div class="invalid-feedback">Please, leave your message</div>
                    </div>
                    <div class="pt-2">
                        <button class="btn btn-lg btn-primary w-sm-auto w-100" type="submit">Submit form</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</template>
<script setup>
import { ref } from "vue"
import { useRouter } from 'vue-router';
const router = useRouter()
import axios from 'axios';
const contact=ref({
    name:"",
    email:"",
    message:""

})
const addContact=async()=>{
    await
        axios.post("http://localhost:8000/api/contacts/",contact.value)
            .then(() => (

                router.push({ name: 'acceuil' })
            ))
            .catch(err => console.log(err))

}
</script>
