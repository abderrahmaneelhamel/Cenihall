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
      $cookies.remove('date');
      var day = new Date();
        var dd = String(day.getDate()).padStart(2, '0');
        var mm = String(day.getMonth() + 1).padStart(2, '0');
        var yyyy = day.getFullYear();

      day = yyyy + '-' + mm + '-' + dd;
      $cookies.set('date',day);

  }
}
</script>
