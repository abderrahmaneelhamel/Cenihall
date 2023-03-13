<template>
  <div class="flex justify-center my-20">    
  <div id="form" class="bg-white border border-gray-200 rounded-lg mt-24 shadow sm:p-6 md:p-8 dark:bg-gray-800 dark:border-gray-700">
      <form class="object-center" method="post" @submit.prevent="login">
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Login to your account</h5>
          <div class="my-6">
              <label for="identifier" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your identifier</label>
              <input type="text" v-model="identifier" name="identifier" id="identifier" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="identifier" required>
          </div>
          <div class="flex items-center justify-center">
              <input checked id="checked-checkbox" value="true" v-model="keep" type="checkbox"  class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
              <label for="checked-checkbox" class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">Keep me in</label>
          </div>
          <button type="submit" class="w-full my-4 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Login to your account</button>
          <div class="text-sm font-medium mt-6 text-gray-500 dark:text-gray-300">
              Not registered? <router-link to="/register" class="text-blue-700 hover:underline dark:text-blue-500">Create account</router-link>
          </div>
      </form>
  </div>
  </div>
</template>
<style>
#form{
  width: 45%;
}
@media only screen and (max-width: 650px){
  #form{
    background-color: rgb(17 24 39/var(--tw-bg-opacity));
    border : 0;
    width: 90%;
  }
}
</style>
<script>
import axios from 'axios'
import cookies from 'vue-cookies'
import swal from 'sweetalert';


    export default {
      name: 'loginView',
      data(){
        return{
          identifier : "",
          keep : Boolean,
        }
      },
      methods: {
        login(){
          let ident = this.identifier;
          let trt = 0;
          let keep = this.keep;
          let router = this.$router;
          axios.get('http://cinehallApi.com/getUser')
          .then(function (response) {
            let temp = response.data;
            temp.map((item) => {
              if(ident == item.identifier){
                trt = 1;
                if(keep == false){
                  cookies.set('identifier', ident);
                  cookies.set('id', item.id);
                  cookies.set('fullname', item.fullName);
                  cookies.set('image', item.image);
                  cookies.set('email', item.email);
                  cookies.set('role', item.role);
                }else{
                  var date = new Date();
                  date.setTime(date.getTime() + (30 * 1000));
                  cookies.set('identifier', ident, { expires: date });
                  cookies.set('fullname', item.fullName, { expires: date });
                  cookies.set('image', item.image, { expires: date });
                  cookies.set('id', item.id, { expires: date });
                  cookies.set('email', item.email, { expires: date });
                  cookies.set('role', item.role, { expires: date });
                }
                router.push('/home').then(() => { router.go() });
              }
            });
            if(trt == 0){
              swal({
                    title: "Non valid identifier!",
                    icon: "error",
                    button: "ok",
              })
            }
          })
          .catch(function (error) {
            console.log(error);
          }); 
          this.identifier = '';
        }
      },
      created(){
       $cookies.remove('identifier')
        $cookies.remove('id');
        $cookies.remove('fullname');
        $cookies.remove('image');
        $cookies.remove('email');
        $cookies.remove('role');
    }

        
    }

</script>