<template>
    <div class="flex justify-center my-20">    
    <div id="form" class="bg-white border border-gray-200 rounded-lg mt-20 shadow sm:p-6 md:p-8 dark:bg-gray-800 dark:border-gray-700">
        <form class="object-center" method="post" @submit.prevent="signup">
            <h5 class="text-xl font-medium text-gray-900 dark:text-white">Sign in to our platform</h5>
            <div class="my-6">
                <label for="full_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your full name</label>
                <input type="text" name="fullname" v-model="fullname" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="Full Name" required>
            </div>
            <div class="my-6">
                <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your email</label>
                <input type="email" name="email" v-model="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="name@company.com" required>
            </div>
            <div class="my-6">
                <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your password</label>
                <input type="password" name="password" v-model="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" required>
            </div>
            <button type="submit" class="w-full my-4 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Sign me in !</button>
            <div class="text-sm font-medium mt-6 text-gray-500 dark:text-gray-300">
                You have an account? <router-link to="/login" class="text-blue-700 hover:underline dark:text-blue-500">Log in</router-link>
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

    export default {
        name: 'registerView',
        data(){
            return{
                fullname: '',
                email: '',
                password: '',
                role: 'client',
            }
        },
        methods :{
            signup(){
                let formData = new FormData();
                    formData.append('fullname', this.fullname);
                    formData.append('email', this.email);
                    formData.append('role', this.role);
                    formData.append('password', this.password);

                const options = {
                    method: 'POST',
                    body: formData
                };
                fetch('http://cinehallApi.com/createUser',options).then(response => response.json())
                .then(data =>{alert(data.message);}).then(
                    this.$router.push('/login')
                ).catch(function (error) {
                    console.error(error);
                }); 
            }
        }
    }

</script>