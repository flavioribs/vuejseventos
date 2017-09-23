<template>
    <div class="login">
        <md-layout md-tag="form" md-align="center" novalidate >
            <md-layout md-tag="md-card" md-column md-flex="30" md-flex-medium="40" md-flex-small="60" md-flex-xsmall="90" class="md-primary">
            <md-card-header>
                <div class="md-title">Novo Usuário</div>
            </md-card-header>

            <md-card-content>
                <md-input-container>
                <md-icon>person</md-icon>
                <label>Nome</label>
                <md-input email required v-model="usuario.Nome" />
                </md-input-container>

                <md-input-container>
                <md-icon>person</md-icon>
                <label>Email</label>
                <md-input email required v-model="usuario.Email" />
                </md-input-container>

                <md-input-container>
                <md-icon>person</md-icon>
                <label>Usuário</label>
                <md-input email required v-model="usuario.UserName" />
                </md-input-container>

                <md-input-container md-has-password>
                <md-icon>lock</md-icon>
                <label>Senha</label>
                <md-input type="password" required v-model="usuario.Senha" />
                </md-input-container>
            </md-card-content>

            <md-card-actions>
                <md-button v-on:click="adicionar(usuario)"  type="submit">Cadastrar</md-button>
            </md-card-actions>
            </md-layout>

        </md-layout>
    </div>
</template>
<script type="text/javascript">    
  import {Jwt} from './../services/resources';
  import mytoastHelper from './../helpers/toastHelper';
  import GlobalKeys from './../helpers/constVariables';  
  import axios from 'axios';

    export default {
        data(){
            return {
                usuario: {
                    UserName: '',
                    Senha:'',
                    Email: '',
                    Nome: ''
                },
                error: {
                    error: false,
                    message: ''
                }
            }
        },
        methods: {
            adicionar(usuario){
                var config = {
                     headers: {'Content-Type': 'application/json'}
                };
                axios.post(GlobalKeys.getUrlBase()+'/api/usuario/novo', 
                      {Nome: this.usuario.Nome, UserName : this.usuario.UserName, Senha : this.usuario.Senha, Email : this.usuario.Email }, config
                    ).then(response => {
                           mytoastHelper.newToast('Cadastrado com sucesso.', 'success', 'warning');   
                           this.$router.push({name: 'Login'});
                        
                    }).catch(e => {
                        mytoastHelper.newToast('Deu algo errado! =/', 'error', 'warning');   
                       
                    });
            }
        }
    }
</script>
<style scoped>
    .login{
        padding-top:50px;
    }
</style>