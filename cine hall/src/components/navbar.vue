<template>
   
<nav class="bg-white fixed w-full z-20 top-0 left-0 border-b border-gray-200 px-2 sm:px-4 py-2.5 rounded dark:bg-gray-900 border-gray-500">
  <div class="container flex flex-wrap items-center justify-between mx-auto">
  <router-link to="/" class="flex items-center">
      <img src="assets/images/logo_cinehall.png" class="h-6 mr-3 sm:h-9" alt="Logo" />
      <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">CineHall</span>
  </router-link>
  <div class="flex items-center md:order-2">
      <button v-if="client" type="button" style="margin-right: 0.75rem;" class="flex mb-3 text-sm bg-gray-800 rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600" id="user-menu-button" aria-expanded="false" data-dropdown-toggle="user-dropdown" data-dropdown-placement="bottom">
        <span class="sr-only">Open user menu</span>
        <img v-if="img != null" class="w-8 h-8 rounded-full" :src="img" alt="user photo">
        <div v-else class="relative inline-flex items-center justify-center w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
        <span class="font-medium text-gray-600 dark:text-gray-300">{{ init }}</span>
        </div>
      </button>
      <router-link v-if="!client" to="/login" class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-cyan-500 to-blue-500 group-hover:from-cyan-500 group-hover:to-blue-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-cyan-200 dark:focus:ring-cyan-800">
        <span class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
            Login
        </span>
    </router-link>
    <router-link @click="logout" v-else to="/login" class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm font-medium text-gray-900 rounded-lg group bg-gradient-to-br from-cyan-500 to-blue-500 group-hover:from-cyan-500 group-hover:to-blue-500 hover:text-white dark:text-white focus:ring-4 focus:outline-none focus:ring-cyan-200 dark:focus:ring-cyan-800">
        <span class="relative px-5 py-2.5 transition-all ease-in duration-75 bg-white dark:bg-gray-900 rounded-md group-hover:bg-opacity-0">
            logout
        </span>
    </router-link>
      <!-- Dropdown menu -->
      <div v-if="client" class="z-50 hidden my-4 text-base list-none bg-white divide-y divide-gray-100 rounded-lg shadow dark:bg-gray-700 dark:divide-gray-600" id="user-dropdown">
        <div class="px-4 py-3">
          <span class="block text-sm text-gray-900 dark:text-white">👤</span>
          <span class="block text-sm text-gray-900 dark:text-white">{{ name }}</span>
          <span class="block text-sm font-medium text-gray-500 truncate dark:text-gray-400">{{ email }}</span>
        </div>
        <ul class="py-2" aria-labelledby="user-menu-button">
          <li>
            <router-link @click="logout" to="/login" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Sign out</router-link>
          </li>
        </ul>
      </div>
      <button data-collapse-toggle="mobile-menu-2" type="button" class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="mobile-menu-2" aria-expanded="false">
        <span class="sr-only">Open main menu</span>
        <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
    </button>
  </div>
  <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="mobile-menu-2">
    <ul class="flex flex-col p-4 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
      <li>
        <router-link to="/" class="block py-2 pl-3 pr-4 text-white bg-gray-800 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white" aria-current="page">Home</router-link>
      </li>
      <li>
        <router-link v-if="client" to="/about" class="block py-2 pl-3 pr-4 text-white bg-gray-800 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white">about</router-link>
      </li>
      <li>
        <router-link v-if="client" to="/reservations" class="block py-2 pl-3 pr-4 text-white bg-gray-800 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white">reservations</router-link>
      </li>
      <li>
        <router-link v-if="client && role == 'admin'" to="/dashboard" class="block py-2 pl-3 pr-4 text-white bg-gray-800 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white">dashboard</router-link>
      </li>
    </ul>
  </div>
  </div>
</nav>
</template>
<script>
export default {
    name: 'navbar',
    data(){
      return{
        client : false,
        name : '',
        email : '',
        role : '',
        init : '',
        img : null,
      }
    },
    created(){
        if($cookies.get('identifier')){
          this.client = true;
          let name = $cookies.get('fullname');
          this.name = $cookies.get('fullname');
          this.img = $cookies.get('image');
          this.email = $cookies.get('email');
          this.role = $cookies.get('role');
          function getInitials(name) {
              var names = name.split(' ');
              var initials = names[0].substring(0, 1).toUpperCase();
              
              if (names.length > 1) {
                  initials += names[names.length - 1].substring(0, 1).toUpperCase();
              }
              return initials;
          };
          this.init = getInitials(name);
        }else{
          this.client = false
        }
    },
    methods: {
      logout(){
        $cookies.remove('identifier');
        $cookies.remove('fullname');
        $cookies.remove('email');
        $cookies.remove('role');
        $cookies.remove('image');
        this.client = false;
      }
    }
      
}
</script>