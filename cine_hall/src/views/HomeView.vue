<template>
    <hero />
    <list />
</template>

<script>
// @ is an alias to /src
import hero from '@/components/hero.vue'
import list from '@/components/list.vue'

export default {
  name: 'HomeView',
  components: {
    hero,
    list,
  },
  created(){
    const options = {
      method: 'GET',
    };
        
      fetch('http://cinehallApi.com/rand', options)
      .then(response => response.json())
      .catch(err => console.error(err));
  }
}
</script>
