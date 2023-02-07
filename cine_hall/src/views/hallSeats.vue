<template>
<div class="flex flex-wrap mt-32 mb-32"> 
    <div v-for="seat in seats" :key="seat.id" style="width: 10%" class="mt-8">
            <h1 class="max-w-2xl mb-2 font-light text-gray-500 lg:mb-2 md:text-lg lg:text-xl dark:text-gray-400">{{ seat.id }}</h1>
            <img class="mr-8" v-if="seat.is_booked == 1" src="assets/images/redChair.png" alt="red">
            <img @click="book(seat.id)" class="mr-8" v-else src="assets/images/greenChair.png" alt="green">
    </div>
</div>  
</template>
<script>
export default {
    name : 'hallSeats',
    data(){
        return{
            seats : [],
        }
    },
    props: {
        id: {
            type: String,
            default: null,
        }
    },
    methods : {
        book(seat){
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0');
            var yyyy = today.getFullYear();

            today = yyyy + '-' + mm + '-' + dd;
            console.log(today);
            let formData = new FormData();
                formData.append('id', seat);
                console.log(seat)
                console.log(1)
                console.log($cookies.get('id'))
                console.log(today)
                console.log(this.id)
                formData.append('is_booked', 1);
                formData.append('costumer', $cookies.get('id'));
                formData.append('seat', seat);
                formData.append('date', today);
                formData.append('hall', this.id);
            const options = {
                method: 'POST',
                body: formData
            };
            fetch('http://cinehallApi.com/bookSeat',options).then(
                this.$router.go()
            )
            .catch(function (error) {
                console.error(error);
            }); 
        }
    },
    created(){
        let formData = new FormData();
                formData.append('id', this.id);

            const options = {
                method: 'POST',
                body: formData
            };
            fetch('http://cinehallApi.com/getSingleSeat',options).then(response => response.json())
            .then(data =>{
                this.seats = data
            })
            .catch(function (error) {
                console.error(error);
            }); 
    }

}
</script>