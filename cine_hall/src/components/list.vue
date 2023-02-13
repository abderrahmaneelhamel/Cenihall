<template>
    
    <div class="bg-white bg-white dark:bg-gray-900" id="halls">
        <div id="popup-modal" tabindex="-1" class="fixed flex justify-center items-center top-0 left-0 right-0 z-50 hidden p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-modal md:h-full">
            <div class="relative w-full h-full max-w-md md:h-auto">
                <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                    <div class="p-6 text-center">
                        <svg aria-hidden="true" class="mx-auto mb-4 text-gray-400 w-14 h-14 dark:text-gray-200" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">please choose today or a future date</h3>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <form>
                <div class="flex flex-col items-center">
                    <label class="mb-4 font-extrabold tracking-tight leading-none dark:text-white" for="date">Choose a date</label>
                    <input style="border-radius: 5%; width: 200px" type="date" @change="changee" name="date" v-model="date">  
                </div>    
            </form>
        </div>
      <div class="mx-auto max-w-2xl py-16 px-4 sm:py-24 sm:px-6 lg:max-w-7xl lg:px-8">
        <h2 class="text-2xl font-bold tracking-tight text-gray-200">Choose a hall</h2>
  
        <div class="mt-6 grid grid-cols-1 gap-y-10 gap-x-6 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8">
          <div v-for="hall in halls" :key="hall.id" class="group relative">
            <h1 class="max-w-2xl mb-6 font-light text-gray-500 lg:mb-8 md:text-lg lg:text-xl dark:text-gray-400">{{ hall.label }}</h1>
            <div class="min-h-80 aspect-w-1 aspect-h-1 w-full overflow-hidden rounded-md bg-gray-200 group-hover:opacity-75 lg:aspect-none lg:h-80">
              <img :src="hall.image" :alt="hall.image" class="h-full w-full object-cover object-center lg:h-full lg:w-full" />
            </div>
            <div class="mt-4 flex justify-between flex-wrap ">
              <div>
                <h3 class="text-sm text-white">
                  <router-link :to="'/hallSeats?id='+hall.id">
                    <span aria-hidden="true" class="absolute inset-0" />
                    {{ hall.title }}
                  </router-link>
                </h3>
              </div>
              <p class="text-sm font-medium text-white">Price : {{ hall.price }}$</p>
              <p class="text-sm font-medium text-white">Time : 8:00 PM</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
import { Modal } from 'flowbite';
import swal from 'sweetalert';

export default {
    name: 'navbar',
    data(){
      return{
        halls : [],
        date : '',
      }
    },
    methods : {
        changee(){
          var day = new Date();
          var dd = String(day.getDate()).padStart(2, '0');
          var mm = String(day.getMonth() + 1).padStart(2, '0');
          var yyyy = day.getFullYear();
          day = yyyy + '-' + mm + '-' + dd;

          if(this.date >= day){
            $cookies.set('date',this.date);
            
            let formData = new FormData();
                    formData.append('date', this.date);

            const options = {
                method: 'POST',
                body : formData,
            };
            fetch('http://cinehallApi.com/rand2', options)
            .then(response => response.json())
            .then(data =>{
              if(data == '0'){
                this.halls = []
                swal({
                    title: "No movies for this day!",
                    text: "pick another day!",
                    icon: "error",
                    button: "ok",
                })
                .then((value) => {
                  this.$router.go();
                })
             }else{
                this.halls = data;
              }
                 
            })
            .catch(err => console.error(err));
          }else{
            const $targetEl = document.getElementById('popup-modal');
            const options = {
              placement: 'bottom-right',
              backdrop: 'dynamic',
              backdropClasses: 'bg-gray-900 bg-opacity-50 dark:bg-opacity-80 fixed inset-0 z-40',
              closable: true,
              onHide: () => {
                  console.log('modal is hidden');
              },
              onShow: () => {
                  console.log('modal is shown');
              },
              onToggle: () => {
                  console.log('modal has been toggled');
              }
            };
            const modal = new Modal($targetEl, options);
            modal.show();
            var timeout = setTimeout(function(){modal.hide()},1500);
            this.date = day;
          }
      }
    },
    async created(){
        async function ono(){
            for(let i = 1 ; i <= 4 ; i++){
               let formData = new FormData();
                    formData.append('id', i);

                const options = {
                    method: 'POST',
                    body: formData
                };
                fetch('http://cinehallApi.com/check',options).then(response => response.json())
                .catch(function (error) {
                    console.error(error);
                }); 
            }
        }
        const options = {
            method: 'GET',
            };
        ono().then(
            fetch('http://cinehallApi.com/getHall', options)
            .then(response => response.json())
            .then(data =>{
            this.halls = data 
            })
            .catch(err => console.error(err))
        )
    }
}
  </script>