<template>
<div class="relative my-28 overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3">
                    id
                </th>
                <th scope="col" class="px-6 py-3">
                    Costumer
                </th>
                <th scope="col" class="px-6 py-3">
                    Seat
                </th>
                <th scope="col" class="px-6 py-3">
                    Hall
                </th>
                <th scope="col" class="px-6 py-3">
                    date
                </th>
                <th scope="col" class="px-6 py-3">
                    Action
                </th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="reservation in reservations" :key="reservation.id" class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                    {{ reservation.id }}
                </th>
                <td class="px-6 py-4">
                    {{ reservation.costumer }}
                </td>
                <td class="px-6 py-4">
                    {{ reservation.seat }}
                </td>
                <td class="px-6 py-4">
                    {{ reservation.hall }}
                </td>
                <td class="px-6 py-4">
                    {{ reservation.date }}
                </td>
                <td class="px-6 py-4">
                    <button type="button" @click="deleteR(reservation.id,reservation.seat)" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Delete</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>
</template>
<script>
    export default {
      name: 'reservations',
      data(){
        return{
            reservations : []
        }
      },
      methods : {
        deleteR(id,idS){
            let formData = new FormData();
                    formData.append('id', id);
                    formData.append('idS', idS);

                const options = {
                    method: 'POST',
                    body: formData
                };
            fetch('http://cinehallApi.com/deleteReservation',options).then(response => response.json())
            .then(data =>{
                console.log(data.message);
                this.$router.go();
            })
            .catch(function (error) {
                console.error(error);
            });
        }
      },
      created(){
        let formData = new FormData();
                    formData.append('id', $cookies.get('id'));

                const options = {
                    method: 'POST',
                    body: formData
                };
                fetch('http://cinehallApi.com/getSingleReservation',options).then(response => response.json())
                .then(data =>{
                    this.reservations = data 
                })
                .catch(function (error) {
                    console.error(error);
                });
      }
    }  
</script>