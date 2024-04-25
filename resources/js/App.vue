<template>
    <body class="bg-dark">
    <header class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark" data-scroll-header>
        <div class="container"><a class="navbar-brand me-3 me-xl-4" href="">
            <img class="d-block" :src="'/assets/img/logo/logo-light.svg'" width="116" alt="Finder"></a>
            <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

            <div class="dropdown d-none d-lg-block order-lg-3 my-n2 me-3" v-if="isLogged">
                    <a class="d-block py-2"
                    href="car-finder-account-info.html">



                    <img class="rounded-circle"  :src="'/assets/noimage.PNG'"  width="40" alt="Finder">
                    <template >
                        <img :src="'/assets/noimage.PNG'" alt=" " class="rounded-circle" width="40">
                    </template>

                    </a>


                    <div class="dropdown-menu dropdown-menu-dark dropdown-menu-end">
                    <div class="d-flex align-items-start border-bottom border-light px-3 py-1 mb-2" style="width: 16rem;">
                        <img class="rounded-circle"  :src="'/assets/noimage.PNG'" width="48" alt="Finder">
                        <template >
                        <img :src="'/assets/noimage.PNG'"  alt=" " class="rounded-circle" width="48">
                        </template>
                        <div class="ps-2">
                        <h6 class="fs-base text-light mb-0"></h6>
                        <div class="fs-8 py-2">{{auth_user.name}}</div>
                        </div>
                    </div><a class="dropdown-item" href="/dashboard"><i class="fi-user me-2"></i>Personal
                        Info</a><a class="dropdown-item"
                        href="/cars"><i class="fi-car me-2"></i>My Cars</a>
                    <div class="dropdown-divider"></div>
                    <button class="dropdown-item" @click="logout">Sign Out</button>
                    </div>
            </div>

            <a class="btn btn-link btn-light btn-sm d-none d-lg-block order-lg-3" href="/login" v-if="!isLogged">
                <i class="fi-user me-2"></i>Sign in</a>

            <a class="btn btn-link btn-light btn-sm d-none d-lg-block order-lg-3" href="/register" v-if="!isLogged">
                <i class="fi-user me-2"></i>Register</a>


            <div class="collapse navbar-collapse order-lg-2" id="navbarNav">
                <ul class="navbar-nav navbar-nav-scroll" style="max-height: 35rem;">


                    <li class="nav-item active"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item active"><a class="nav-link" href="/listCar">Cars</a></li>
                    <li class="nav-item active"><a class="nav-link" href="/contacts">Contact</a></li>




                </ul>
            </div>
        </div>
    </header>

    <router-view> </router-view>

    <footer class="footer bg-faded-light">
        <div class="border-bottom border-light py-4">
            <div class="container d-sm-flex align-items-center justify-content-between"><a class="d-inline-block" href=""><img :src="'/assets/img/logo/logo-light.svg'" width="116" alt="logo"></a>
                <div class="d-flex pt-3 pt-sm-0">
                    <div class="dropdown ms-n3">
                        <button class="btn btn-light btn-link btn-sm dropdown-toggle fw-normal py-2" type="button" data-bs-toggle="dropdown"><i class="fi-globe me-2"></i>Eng</button>
                        <div class="dropdown-menu dropdown-menu-dark w-100"><a class="dropdown-item" href="#">Deutsch</a><a class="dropdown-item" href="#">Français</a><a class="dropdown-item" href="#">Español</a></div>
                    </div>
                    <div class="dropdown">
                        <button class="btn btn-light btn-link btn-sm dropdown-toggle fw-normal py-2 pe-2" type="button" data-bs-toggle="dropdown"><i class="fi-map-pin me-2"></i>New York</button>
                        <div class="dropdown-menu dropdown-menu-dark dropdown-menu-sm-end" style="min-width: 7.5rem;"><a class="dropdown-item" href="#">Chicago</a><a class="dropdown-item" href="#">Dallas</a><a class="dropdown-item" href="#">Los Angeles</a><a class="dropdown-item" href="#">San Diego</a></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container pt-4 pb-3 pt-lg-5 pb-lg-4">
            <div class="row pt-2 pt-lg-0">
                <div class="col-lg-3 pb-2 mb-4">
                    <h3 class="h5 text-light mb-2">Subscribe to our newsletter</h3>
                    <p class="fs-sm text-light opacity-70">Don’t miss any relevant offers!</p>
                    <form class="form-group form-group-light w-100">
                        <div class="input-group input-group-sm"><span class="input-group-text"> <i class="fi-mail"></i></span>
                            <input class="form-control" type="text" placeholder="Your email">
                        </div>
                        <button class="btn btn-primary btn-icon btn-sm" type="button"><i class="fi-send"></i></button>
                    </form>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6 offset-xl-1 mb-2 mb-sm-4">
                    <h3 class="fs-base text-light">Buying &amp; Selling</h3>
                    <ul class="list-unstyled fs-sm">
                        <li><a class="nav-link-light" href="#">Find a car</a></li>
                        <li><a class="nav-link-light" href="#">Sell your car</a></li>
                        <li><a class="nav-link-light" href="#">Car dealers</a></li>
                        <li><a class="nav-link-light" href="#">Compare cars</a></li>
                        <li><a class="nav-link-light" href="#">Online car appraisal</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6 mb-2 mb-sm-4">
                    <h3 class="fs-base text-light">About</h3>
                    <ul class="list-unstyled fs-sm">
                        <li><a class="nav-link-light" href="#">About Finder</a></li>
                        <li><a class="nav-link-light" href="#">Contact us</a></li>
                        <li><a class="nav-link-light" href="#">FAQs &amp; support</a></li>
                        <li><a class="nav-link-light" href="#">Mobile app</a></li>
                        <li><a class="nav-link-light" href="#">Blog</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6 mb-2 mb-sm-4">
                    <h3 class="fs-base text-light">Profile</h3>
                    <ul class="list-unstyled fs-sm">
                        <li><a class="nav-link-light" href="#">My account</a></li>
                        <li><a class="nav-link-light" href="#">Wishlist</a></li>
                        <li><a class="nav-link-light" href="#">My listings</a></li>
                        <li><a class="nav-link-light" href="#">Add listing</a></li>
                    </ul>
                </div>
                <div class="col-xl-2 col-lg-3 col-sm-6 col-md-3 mb-2 mb-sm-4"><a class="d-flex align-items-center text-decoration-none mb-2" href="tel:4065550120"><i class="fi-device-mobile me-2"></i><span class="text-light">(406) 555-0120</span></a><a class="d-flex align-items-center text-decoration-none mb-2" href="mailto:example@email.com"><i class="fi-mail me-2"></i><span class="text-light">example@email.com</span></a>
                    <div class="d-flex flex-wrap pt-4"><a class="btn btn-icon btn-translucent-light btn-xs rounded-circle mb-2 me-2" href="#"><i class="fi-facebook"></i></a><a class="btn btn-icon btn-translucent-light btn-xs rounded-circle mb-2 me-2" href="#"><i class="fi-twitter"></i></a><a class="btn btn-icon btn-translucent-light btn-xs rounded-circle mb-2 me-2" href="#"><i class="fi-telegram"></i></a><a class="btn btn-icon btn-translucent-light btn-xs rounded-circle mb-2" href="#"><i class="fi-messenger"></i></a></div>
                </div>
            </div>
        </div>
        <div class="container d-lg-flex align-items-center justify-content-between fs-sm pb-3">
            <div class="d-flex flex-wrap justify-content-center order-lg-2 mb-3"><a class="nav-link nav-link-light fw-normal" href="#">Terms of use</a><a class="nav-link nav-link-light fw-normal" href="#">Privacy policy</a><a class="nav-link nav-link-light fw-normal" href="#">Accessibility statement</a><a class="nav-link nav-link-light fw-normal pe-0" href="#">Interest based ads</a></div>
            <p class="text-center text-lg-start order-lg-1 mb-lg-0"><span class="text-light opacity-50">&copy; All rights reserved. Made by </span><a class="nav-link-light fw-bold" href="https://createx.studio/" target="_blank" rel="noopener">Createx Studio</a></p>
        </div>
    </footer>
    </body>
</template>
<script setup>
import { ref,onMounted  } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';

const router = useRouter();
const isLogged = ref(false);
const auth_user = ref({ email: '',name:'' });
const getUser = async () => {
    try {
        let token = localStorage.getItem('token');
        const response = await axios.get("http://localhost:8000/api/user", {
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });


        if (response.data) {
            auth_user.value = response.data;
            console.log(auth_user.value);
            isLogged.value = true;
        } else {
            console.error('Invalid response structure:', response.data);
        }
    } catch (error) {
        console.error('Error fetching authenticated user:', error);
    }
}

const logout=async()=> {
let token=""

token=localStorage.getItem('token')
console.log(token)
axios.post('http://localhost:8000/api/logout', null, {

headers: {
'Authorization': `Bearer ${token}`
}
})

.then((response) => {
console.log(response)
localStorage.removeItem('token');
localStorage.removeItem('user');
isLogged.value = false;

router.push("/login")
})
.catch(err => {console.log(err);alert(err) })

}


const logged = () => {
  let token = localStorage.getItem('token');
  if (token) {
    console.log('Token is present:', token);
    isLogged.value = true;
  } else {
    console.log('Token is not present');
    isLogged.value = false;
  }
}

onMounted(() => {
    getUser();
    logged();
});
</script>
