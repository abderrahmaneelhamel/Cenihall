<template>
    <div class="bg-white bg-white dark:bg-gray-900" id="halls">
      <div class="mx-auto max-w-2xl py-16 px-4 sm:py-24 sm:px-6 lg:max-w-7xl lg:px-8">
        <h2 class="text-2xl font-bold tracking-tight text-gray-200">Choose a hall</h2>
  
        <div class="mt-6 grid grid-cols-1 gap-y-10 gap-x-6 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8">
          <div v-for="hall in halls" :key="hall.id" class="group relative">
            <h1 class="max-w-2xl mb-6 font-light text-gray-500 lg:mb-8 md:text-lg lg:text-xl dark:text-gray-400">{{ hall.label }}</h1>
            <div class="min-h-80 aspect-w-1 aspect-h-1 w-full overflow-hidden rounded-md bg-gray-200 group-hover:opacity-75 lg:aspect-none lg:h-80">
              <img :src="hall.image" :alt="hall.image" class="h-full w-full object-cover object-center lg:h-full lg:w-full" />
            </div>
            <div class="mt-4 flex justify-between">
              <div>
                <h3 class="text-sm text-white">
                  <router-link :to="'/hallSeats?id='+hall.id">
                    <span aria-hidden="true" class="absolute inset-0" />
                    {{ hall.title }}
                  </router-link>
                </h3>
              </div>
              <p class="text-sm font-medium text-white">{{ hall.price }}$</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
export default {
    name: 'navbar',
    data(){
      return{
        halls : [],
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
        function dos(){
            const options = {
            method: 'GET',
            };
        
            fetch('http://cinehallApi.com/getHall', options)
            .then(response => response.json())
            .then(data =>{
            return(data) 
            })
            .catch(err => console.error(err));
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