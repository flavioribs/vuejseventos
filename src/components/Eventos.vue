<template>
<div class="container" >
    <span class="md-display-1" style="padding-bottom:20px !important;">Próximos Eventos</span>
    </br>
      <div style="padding-left:80px;padding-right:200px;">
      <md-input-container>
      
       <label>Pesquisar Eventos</label>

        <md-input v-model="filter"></md-input>
        </md-input-container>
      </div>
   
    <md-card v-for="even in evento">  
        <md-card-header>
            <div class="md-title">{{even.nome}}</div>
            <div class="md-subhead">Data: {{even.dataInicio}} à {{even.dataFim}} </div>
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
                          console.log(this.evento);
                     });
            }
        },       
        mounted(){
            this.eventos();
        },
         computed:{
            filtros(){
            
                 //let colecao = _.orderBy(this.evento, this.nome);
                return _.filter(this.evento, item=>{ return item.nome.indexOf(this.filter)>=0});
            }           
        },
        filters: {
            capitalize: function (value) {
            if (!value) return ''
            value = value.toString()
            return value.charAt(0).toUpperCase() + value.slice(1)
    }
  }
}
</script>