import { createApp } from 'vue';
import { createRouter, createWebHistory } from "vue-router";
import { routes } from "./routes";
import ChildComponent from './components/nav.vue';


import App from './App.vue'
let app = createApp(App)
const router = createRouter({
    history: createWebHistory(),
    routes: routes,
})
app.use(router);
app.component('ChildComponent', ChildComponent);
app.mount("#app")
