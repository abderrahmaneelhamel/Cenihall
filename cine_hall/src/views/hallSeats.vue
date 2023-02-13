<template>
<div class="flex flex-wrap mt-32 mb-32"> 
    <div v-for="seat in seats" :key="seat.id" id="seat" class="mt-8">
            <h1 class="max-w-2xl mb-2 font-light text-gray-500 lg:mb-2 md:text-lg lg:text-xl dark:text-gray-400">{{ seat.id }}</h1>
            <img @click="book(seat.id)" class="mr-8" v-if="!booked.includes(seat.id)" src="assets/images/greenChair.png" alt="green">
            <img class="mr-8" v-else src="assets/images/redChair.png" alt="red">
    </div>
</div>  
</template>
<style>
#seat{
    width: 10%;
}
@media only screen and (max-width: 600px) {
    #seat{
        width: 25%;
    }   
}
</style>
<script>
export default {
    name : 'hallSeats',
    data(){
        return{
            seats : [],
            booked :  [],
            day : '',
            g:false,
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
            if($cookies.get('date')){
                var day = $cookies.get('date');
            }else{
                var day = new Date();
                var dd = String(day.getDate()).padStart(2, '0');
                var mm = String(day.getMonth() + 1).padStart(2, '0');
                var yyyy = day.getFullYear();

                day = yyyy + '-' + mm + '-' + dd;
            }
            
            let formData = new FormData();
                formData.append('id', seat);
                console.log(seat)
                console.log(1)
                console.log($cookies.get('id'))
                console.log(day)
                console.log(this.id)
                formData.append('is_booked', day);
                formData.append('costumer', $cookies.get('id'));
                formData.append('seat', seat);
                formData.append('date', day);
                formData.append('hall', this.id);
            const options = {
                method: 'POST',
                body: formData
            };
            fetch('http://cinehallApi.com/bookSeat',options).then(response => response.json())
            .then(data =>{
                this.seats = data
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
        var day = new Date();
        var dd = String(day.getDate()).padStart(2, '0');
        var mm = String(day.getMonth() + 1).padStart(2, '0');
        var yyyy = day.getFullYear();

        day = yyyy + '-' + mm + '-' + dd;
        if($cookies.get('date')){
            this.day = $cookies.get('date')
        }else{
            this.day = day;
        }
        let formData = new FormData();
                formData.append('id', this.id);

            const options = {
                method: 'POST',
                body: formData
            };
            fetch('http://cinehallApi.com/getSingleSeat',options).then(response => response.json())
            .then(data =>{
                this.seats = data;
            })
            .catch(function (error) {
                console.error(error);
            }); 


            var date = $cookies.get('date');
            let formData1 = new FormData();
                formData1.append('id', date);
            const options1 = {
                method: 'POST',
                body: formData1
            };
            fetch('http://cinehallApi.com/isBooked',options1).then(response => response.json())
            .then(data =>{
                this.booked = data;
            })
            .catch(function (error) {
                console.error(error);
            });
    }

}
</script>