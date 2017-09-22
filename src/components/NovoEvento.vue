<template>
    <div class="login">
        <md-layout md-tag="form" md-align="center" novalidate >
            <md-layout md-tag="md-card" md-column md-flex="30" md-flex-medium="40" md-flex-small="60" md-flex-xsmall="90" class="md-primary">
            <md-card-header>
                <div class="md-title">Novo Evento</div>
            </md-card-header>

            <md-card-content>
                <md-input-container>
                <md-icon>person</md-icon>
                <label>Nome</label>
                <md-input email required v-model="evento.nome" />
                </md-input-container>

                <md-input-container>
                <md-icon>date_range</md-icon>
                <label>Data de Início</label>
                <md-input date required v-model="evento.dataInicio" />
                </md-input-container>

                <md-input-container>
                <md-icon>date_range</md-icon>
                <label>Data Término</label>
                <md-input date required v-model="evento.dataFim" />
                </md-input-container>

                <md-input-container>
                <md-icon>query_builder</md-icon>
                <label>Hora Início </label>
                <md-input  required v-model="evento.horaInicio" />
                </md-input-container>

                <md-input-container>
                <md-icon>query_builder</md-icon>
                <label>Hora Término</label>
                <md-input  required v-model="evento.horaFim" />
                </md-input-container>

                <md-input-container>
                <md-icon>toc</md-icon>
                <label>Descrição</label>
                <md-input  required v-model="evento.descricao" />
                </md-input-container>


              
            </md-card-content>

            <md-card-actions>
                <md-button v-on:click="login(user)"  type="submit">Cadastrar</md-button>
            </md-card-actions>
            </md-layout>

        </md-layout>
    </div>
</template>
<script type="text/javascript">    
  import {Jwt} from './../services/resources';

    export default {
        data(){
            return {
                evento: {
                    nome: '',
                    dataInicio:'',
                    dataFim:'',
                    horaInicio:'',
                    horaFim: '',
                    descricao:''

                },
                error: {
                    error: false,
                    message: ''
                }
            }
        },
        methods: {
            login(user){
                 console.log('metodo de login', user.username);
                Jwt.accessToken(user.username, user.password)
                    .then((response) => {
                        console.log(response.data);
                        //this.$router.push({name: 'time.list'});
                    })
                    .catch((responseError) => {
                        this.error.error = true;
                        if (responseError.status === 400) {
                            this.error.message = responseError.data.error;
                        } else {
                            this.error.message = 'Login falhou!!'
                        }
                    })
            }
        }
    }
</script>
<style scoped>
    .login{
        padding-top:50px;
    }
</style>