import Login from './components/authentification/login.vue'
import Register from './components/authentification/register.vue'
import Acceuil from "./components/acceuil.vue";
import Dashboard from "./components/admin/dashboard.vue";
import indexCar from "./components/cars/indexCar.vue";
import AddCar from "./components/cars/AddCar.vue";
import index from "./components/contact/index.vue";
import ListCar from "./components/cars/ListCar.vue";
import ListStates from "./components/States/ListStates.vue";
import ListContacts from "./components/contact/ListContacts.vue";
import ListCountries from "./components/Country/ListCountries.vue";
import ListEngines from "./components/Engines/ListEngines.vue";
import ListMarques from "./components/Marques/ListMarques.vue";
import ListModels from "./components/models/ListModels.vue";
import AddCountry from "./components/Country/AddCountry.vue";
import AddEngine from "./components/Engines/AddEngine.vue";
import AddMarque from "./components/Marques/AddMarque.vue";
import AddModel from "./components/models/AddModel.vue";
import AddState from "./components/States/AddState.vue";
import EditMarque from "./components/Marques/EditMarque.vue";
import EditModel from "./components/models/EditModel.vue";
import AddBodyType from "./components/Body_Types/AddBodyType.vue";
import EditBodyType from "./components/Body_Types/EditBodyType.vue";
import ListBodyTypes from "./components/Body_Types/ListBodyTypes.vue";
import AddFuelType from "./components/Fuel_Types/AddFuelType.vue";
import EditFuelType from "./components/Fuel_Types/EditFuelType.vue";
import ListFuelTypes from "./components/Fuel_Types/ListFuelTypes.vue";
import EditCountry from "./components/Country/EditCountry.vue";
import EditState from "./components/States/EditState.vue";
import EditEngine from "./components/Engines/EditEngine.vue";
import Showcar from "./components/cars/Showcar.vue";


export const routes = [
    {
        name: 'acceuil',
        path: '/',
        component: Acceuil
    },
    {
        name: "login",
        path: "/login",
        component: Login,
    },
    {
        name: "register",
        path: "/register",
        component: Register,
    },
    {
        name: "dashboard",
        path: "/dashboard",
        component: Dashboard,
    },
    {
        name: AddMarque,
        path: '/addMarque',
        component: AddMarque
    },

    {
        name:"editMarque",
        path:"/editMarque/:id",
        component:EditMarque
    },
    {
        name:"listMarques",
        path:"/listMarques",
        component:ListMarques
    },
    {
        name: AddModel,
        path: '/addModel',
        component: AddModel
    },
    {
        name:"editModel",
        path:"/editModel/:id",
        component:EditModel
    },

    {
        name:"listModels",
        path:"/listModels",
        component:ListModels
    },

    {
        name: AddBodyType,
        path: '/addBodyType',
        component: AddBodyType
    },
    {
        name:"editBodyType",
        path:"/editBodyType/:id",
        component:EditBodyType
    },
    {
        name:"listBodyTypes",
        path:"/listBodyTypes",
        component:ListBodyTypes
    },

    {
        name: AddFuelType,
        path: '/addFuelType',
        component: AddFuelType
    },
    {
        name:"editFuelType",
        path:"/editFuelType/:id",
        component:EditFuelType
    },
    {
        name:"listFuelTypes",
        path:"/listFuelTypes",
        component:ListFuelTypes
    },

    {
        name: AddCountry,
        path: '/addCountry',
        component: AddCountry
    },

    {
        name: "EditCountry",
        path: '/editCountry/:id',
        component: EditCountry
    },

    {
        name:"listCountries",
        path:"/listCountries",
        component:ListCountries
    },

    {
        name: AddState,
        path: '/addState',
        component: AddState
    },
    {
        name:"editState",
        path:"/editState/:id",
        component:EditState
    },
    {
        name:"listStates",
        path:"/listStates",
        component:ListStates
    },
    {
        name: AddEngine,
        path: '/addEngine',
        component: AddEngine
    },

    {
        name:"editEngine",
        path:"/editEngine/:id",
        component:EditEngine
    },

    {
        name:"listEngines",
        path:"/listEngines",
        component:ListEngines
    },
    {
        name: AddCar,
        path: '/addCar',
        component: AddCar
    },
    {
        name:"cars",
        path:"/cars",
        component:indexCar
    },
    {
        name:"showcar",
        path:"/showcar/:id",
        component:Showcar
    },
    {
        name:"contacts",
        path:"/contacts",
        component:index
    },
    {
        name:"listCar",
        path:"/listCar",
        component:ListCar
    },

    {
        name:"listContact",
        path:"/listContacts",
        component:ListContacts
    },







    {
        name: AddState,
        path: '/addState',
        component: AddState
    },

]
