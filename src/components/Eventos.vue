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
            <!--<div class="md-subhead">Data: {{ frontEndDateFormat(even.dataInicio) }} à {{frontEndDateFormat(even.dataFim)}} </div>-->
            <div class="md-subhead">Data: {{ even.dataInicio }} à {{even.dataFim}} </div>
            <div class="md-subhead">Horário: {{even.horaInicio}} à {{even.horaFim}} </div>
        </md-card-header>    

         <md-card-actions v-show="deleteShowButton(even)">
            <md-button v-on:click="deleteEvent(even)">Excluir</md-button>
        </md-card-actions>
 

        <md-card-content>
           Descricão: {{even.descricao}}
        </md-card-content>
    </md-card>

</div>
</template>
<script>
    import {Eventos} from './../services/resources';
    import {Evento} from './../services/resources';
    import _  from 'lodash';
    import moment from 'moment'    
    import mytoastHelper from './../helpers/toastHelper';
    import event from './../helpers/event';
    import SessionStorage from './../services/session-storage';
    import GlobalKeys from './../helpers/constVariables';

    export default {
        data(){
            return {
                evento : [],
                filter: '',
                conf: {
                    logado: false, 
                    proprietario: false
                }
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
        	},
            logged(){
                let user = SessionStorage.userLogged();
                //var userLogged = SessionStorage.getObject(GlobalKeys.getKeyUser());

                if(!user){
                    this.conf.logado = false;
                }else{
                    this.conf.logado = true;
                }


            },
             deleteShowButton(evento){
                let user = SessionStorage.getObject(GlobalKeys.getKeyUser());
                if(user == null){
                    return false;
                }

                if(evento.usuarioId == user.id){
                   return true;
                }else{
                    return false;
                }
            },
            deleteEvent(evento){
                console.log('ENTROU NO DELETE EVENTO');
                var userLogged = SessionStorage.getObject(GlobalKeys.getKeyUser());

                if(userLogged.id == evento.usuarioId){
                     Evento.excluirEvento(evento)
                     .then((response) => {
                        
                          mytoastHelper.newToast('Evento excluído!.', 'success', 'tag_faces'); 
                          this.eventos();

                     }).catch((responseError) => {
                         if (responseError.status === 400) {
                             this.error.message = responseError.data.error;
                         } else {
                             this.error.message = 'Deu alguma coisa errada!'
                         }
                     });
                }else{
                    mytoastHelper.newToast('Esse evento não pode ser excluído pelo usuário logado!', 'error', 'error'); 
                }
                  
              }                      
        },       
        mounted(){
            this.eventos();           
        },
        created(){
             this.logged();
        }   
    }
</script>