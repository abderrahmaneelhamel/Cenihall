<template>
<div class="mt-24 mb-6">
<div id="authentication-modal" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-modal md:h-full">
    <div class="relative w-full h-full max-w-md md:h-auto">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <div class="px-6 py-6 lg:px-8">
                <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Edit a movie</h3>
                <form class="space-y-6" @submit.prevent="sbm">
                    <div>
                        <label for="date" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your date</label>
                        <input type="date" v-model="date" name="date" id="date" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" required>
                    </div>
                    <button type="submit" class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Edit</button>
                </form>
            </div>
        </div>
    </div>
</div> 
</div>
   <div class="relative md-28 overflow-x-auto shadow-md sm:rounded-lg">
       <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
           <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
               <tr>
                   <th scope="col" class="px-6 py-3">
                       id
                   </th>
                   <th scope="col" class="px-6 py-3">
                       title
                   </th>
                   <th scope="col" class="px-6 py-3">
                       description
                   </th>
                   <th scope="col" class="px-6 py-3">
                       image
                   </th>
                   <th scope="col" class="px-6 py-3">
                       date
                   </th>
                   <th scope="col" class="px-6 py-3">
                       Action
                   </th>
               </tr>
           </thead>
           <tbody>
               <tr v-for="movie in movies" :key="movie.id" class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                   <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                       {{ movie.id }}
                   </th>
                   <td class="px-6 py-4">
                       {{ movie.title }}
                   </td>
                   <td class="px-6 py-4">
                       {{ movie.description }}
                   </td>
                   <td class="px-6 py-4">
                       <img style="width : 30px" :src="movie.image">
                   </td>
                   <td class="px-6 py-4">
                       {{ movie.date }}
                   </td>
                   <td class="px-6 py-4 flex">
                       <button type="button" @click="deleteR(movie.id)" class="text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 focus:outline-none dark:focus:ring-red-800">Delete</button>
                       <button @click="filll(movie.id)" data-modal-target="authentication-modal" data-modal-toggle="authentication-modal" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800" type="button">Edit</button>
                   </td>
               </tr>
           </tbody>
       </table>
   </div>
   </template>
   <script>
    import { Modal } from 'flowbite';

       export default {
         name: 'dashboard',
         data(){
           return{
               movies : [],
               date : '',
               id : null
           }
         },
         methods : {
            sbm(){
                let formData = new FormData();
                       formData.append('id', this.id);
                       formData.append('date', this.date);
   
                   const options = {
                       method: 'POST',
                       body: formData
                   };
               fetch('http://cinehallApi.com/updatemovie',options).then(response => response.json())
               .then(data =>{
                   this.movies = data;
               })
               .catch(function (error) {
                   console.error(error);
               });
               this.$router.go();
            },
            filll(id){
               let formData = new FormData();
                       formData.append('id', id);
   
                   const options = {
                       method: 'POST',
                       body: formData
                   };
               fetch('http://cinehallApi.com/getSinglemovie',options).then(response => response.json())
               .then(data =>{
                   this.date = data[0].date;
                   this.id = data[0].id;
               })
               .catch(function (error) {
                   console.error(error);
               });
               const $targetEl = document.getElementById('authentication-modal');
               var date = document.getElementById('date');
               date.value = this.date;
                const options1 = {
                placement: 'center',
                backdrop: 'dynamic',
                backdropClasses: 'bg-gray-900 bg-opacity-50 dark:bg-opacity-80 fixed inset-0 z-40',
                closable: true,
                };
                const modal = new Modal($targetEl, options1);
                modal.toggle();
            },
            deleteR(id){
               let formData = new FormData();
                       formData.append('id', id);
   
                   const options = {
                       method: 'POST',
                       body: formData
                   };
               fetch('http://cinehallApi.com/deleteReservation',options).then(response => response.json())
               .then(data =>{
                   console.log(data.message);
                   this.$router.go();
               })
               .catch(function (error) {
                   console.error(error);
               });
           }
         },
         created(){
           if(!$cookies.get('identifier')){
               this.$router.push('/login');
           }
           if($cookies.get('role') != 'admin'){
                this.$router.push('/home');
           }
   
                   const options = {
                       method: 'GET',
                   };
                   fetch('http://cinehallApi.com/getmovie',options).then(response => response.json())
                   .then(data =>{
                       this.movies = data 
                   })
                   .catch(function (error) {
                       console.error(error);
                   });
         }
       }  
   </script>
   