<template>
    <heroVue />
</template>
<script>
import heroVue from '@/components/hero.vue';

    export default {
      name: 'AboutView',
      components : {
        heroVue,
      },  
      data(){
        return{
          test : "apple",
        }
      },
      created(){
        if(!$cookies.get('identifier')){
            this.$router.push('/login');
        }
    }
        
    }

</script>