<template>
<div class="container"  style="padding-bottom:20px;  padding-left:100px; padding-right:100px !important;" >
    <span class="md-display-1" style="padding-bottom:20px; padding-left:30px; !important;">Próximos Eventos</span>
    </br>
      <div style="padding-left:80px;padding-right:200px;">
      <md-input-container>
      
       <label>Pesquisar Eventos</label>

        <md-input v-model="filter"></md-input>
        </md-input-container>
      </div>
   
    <md-card v-for="even in filterBy(evento, filter) ">  
        <md-card-header>
            <div class="md-title">{{even.nome}}</div>
            <div class="md-subhead">Data: {{ frontEndDateFormat(even.dataInicio) }} à {{frontEndDateFormat(even.dataFim)}} </div>
            <div class="md-subhead">Horário: {{even.horaInicio}} à {{even.horaFim}} </div>
        </md-card-header>     

        <md-card-content>
           Descricão: {{even.descricao}}
        </md-card-content>
    </md-card>

</div>
</template>
<script>
    import {Eventos} from './../services/resources';
    import _  from 'lodash';
    import moment from 'moment'    
    import mytoastHelper from './../helpers/toastHelper';

    export default {
        data(){
            return {
                evento : [],
                filter: ''
            }
        },
        methods:{
            eventos(){
                 Eventos.query().then(response => {
                          this.evento = response.data;
                          mytoastHelper.newToast('Você está visualizando os últimos eventos cadastrados.', 'info', 'visibility');   
                     });
            },
            frontEndDateFormat: function(date) {
        		return moment(date, 'YYYY-MM-DD').format('DD/MM/YYYY');
        	},
        	backEndDateFormat: function(date) {
        		return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
        	}
        },       
        mounted(){
            this.eventos();
        }      
    }
</script>