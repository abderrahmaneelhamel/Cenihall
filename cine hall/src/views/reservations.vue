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
                <th scope="col" class="px-6 py-3">
                    Ticket
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
                <td class="px-6 py-4">
                    <button type="button" @click="print(reservation.id)" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">print</button>
                </td>
                <div class="hidden">
                    <div style="width: 43%;" class="ticket" :id="'ticket'+reservation.id">
                        <div class="ticket__content">
                                <div style="display : flex; flex-direction : column; align-items: center; justify-content : center;" class="table">
                                    <div style="display : flex; flex-direction : column; align-items: center; justify-content : center;" class="table-header">
                                        <img style="width: 40%; " src="assets/images/logo_cinehall.png" alt="logo">
                                        <div class="header__item">Costumer : {{ reservation.costumer }}</div>
                                        <div class="header__item">Seat : {{ reservation.seat }}</div>
                                        <div class="header__item">hall : {{ reservation.hall }}</div>
                                        <div class="header__item">date : {{ reservation.date }}</div>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </tr>
        </tbody>
    </table>
</div>
</template>
<script>
  import print from 'print-js'

    export default {
      name: 'reservations',
      data(){
        return{
            reservations : [],
            role : '',
        }
      },
      methods : {
        print(id){
            let tic = 'ticket'+id;
            console.log(tic);
            var t = document.getElementById(tic);
            printJS({
                printable: t,
                type: 'html',
                style: `body {
  background-color: #FCD000;
}

.ticket {
  position: relative;
  box-sizing: border-box;
  width: 300px;
  height: 450px;
  margin: 150px auto 0;
  padding: 20px;
  border-radius: 10px;
  background: #FBFBFB;
  box-shadow: 2px 2px 15px 0px #AB9B0D;
}
.header__item{
    matgin-top : 20px;
}
.table-header{
    display : flex;
    flex-direction : column;
    justify-content : center;
}
.ticket:before, .ticket:after {
  content: "";
  position: absolute;
  left: 5px;
  height: 6px;
  width: 290px;
}
.ticket:before {
  top: -5px;
  background: radial-gradient(circle, transparent, transparent 50%, #FBFBFB 50%, #FBFBFB 100%) -7px -8px/16px 16px repeat-x;
}
.ticket:after {
  bottom: -5px;
  background: radial-gradient(circle, transparent, transparent 50%, #FBFBFB 50%, #FBFBFB 100%) -7px -2px/16px 16px repeat-x;
}

.ticket__content {
  box-sizing: border-box;
  height: 100%;
  width: 100%;
  border: 6px solid #D8D8D8;
}

.ticket__text {
  width: 400px;
  font-family: "Helvetica", "Arial", sans-serif;
  font-size: 3rem;
  font-weight: 900;
  text-transform: uppercase;
  color: #C6DEDE;
  transform: translate(-25px, 25px) rotate(-55deg);
}
`,
            })
        },
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
        if(!$cookies.get('identifier')){
            this.$router.push('/login');
        }
        this.role = $cookies.get('role');
        if(this.role == 'admin'){
            const options = {
                    method: 'GET',
                };
                fetch('http://cinehallApi.com/getReservation',options).then(response => response.json())
                .then(data =>{
                    this.reservations = data 
                })
                .catch(function (error) {
                    console.error(error);
                });
        }else{
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
    }  
</script>
