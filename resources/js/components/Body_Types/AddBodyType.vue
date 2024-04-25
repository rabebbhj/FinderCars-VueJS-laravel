<template>
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
        <div class="row">
            <!-- Sidebar-->
            <ChildComponent />
            <!-- Content-->
            <div class="col-lg-8 col-md-7 mb-5">
                <h1 class="h2 text-light">Add Body Type</h1>
                <form class="needs-validation pb-4" @submit.prevent="addBodyType">

                    <div class="row mb-2">
                        <div class="col-sm-12 mb-3">
                            <label class="form-label text-light" for="account-password-new">Car Type</label>
                            <div class="password-toggle">
                                <input class="form-control form-control-light" type="text" id="car_type" v-model="bodyType.car_type">

                            </div>
                        </div>
                        <div class="col-sm-12 mb-3">
                           
                            <section class="card card-light card-body shadow-sm  mb-4" id="photos">
                            <file-pond
                            name="test"
                            ref="pond"
                            class-name="my-pond"
                            label-idle="Drop files here..."
                            allow-multiple="false"
                            accepted-file-types="image/jpeg, image/png"
                            v-bind:files="myFiles"
                            v-on:init="handleFilePondInit"
                            :server="serverOptions()"
                            />
                        </section>
                            
                        </div>

                    </div>
                    <button class="btn btn-outline-primary" type="submit">Save</button>
                </form>
            </div>
        </div>
    </div>

</template>
<script setup>

import vueFilePond from 'vue-filepond';
import 'filepond/dist/filepond.min.css';
import FilePondPluginImagePreview from 'filepond-plugin-image-preview';

import 'filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css';


const FilePond = vueFilePond(FilePondPluginImagePreview);


import { ref } from "vue"
import { useRouter } from 'vue-router';
const router = useRouter()
import axios from 'axios';
const bodyType=ref({
    car_type:"",
    type_image:"",

})
const addBodyType=async()=>{
    await
        axios.post("http://localhost:8000/api/bodytypes/",bodyType.value)
            .then(() => (

                router.push({ name: 'listBodyTypes' })
            ))
            .catch(err => console.log(err))

}

const handleFilePondInit = async () => {

if (bodyType.value.type_image) {

    myFiles.value = [
        {
            source: bodyType.value.type_image,
            options: { type: 'local' }
        }
    ]
}
}
const serverOptions = () => {
console.log('server pond');
return {
    load: (source, load, error, progress, abort, headers) => {
        var myRequest = new Request(source);
        fetch(myRequest).then(function (response) {
            response.blob().then(function (myBlob) {
                load(myBlob);
            });
        });
    },

    process: (fieldName, file, metadata, load, error, progress, abort) => {
        const data = new FormData();
        data.append('file', file);
        data.append('upload_preset', 'GLID5IIT');
        data.append('cloud_name', 'esps');
        data.append('public_id', file.name);
        axios.post('https://api.cloudinary.com/v1_1/esps/upload', data)


            .then((response) => response.data)
            .then((data) => {
                console.log(data);

                bodyType.value.type_image = data.url;
                load(data);
            })
            .catch((error) => {
                console.error('Error uploading file:', error);
                error('Upload failed');
                abort();
            });
    },
};
};
</script>
