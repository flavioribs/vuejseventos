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
                <md-input email required v-model="user.nome" />
                </md-input-container>

                <md-input-container>
                <md-icon>person</md-icon>
                <label>Email</label>
                <md-input email required v-model="user.email" />
                </md-input-container>

                <md-input-container>
                <md-icon>person</md-icon>
                <label>Usuário</label>
                <md-input email required v-model="user.username" />
                </md-input-container>

                <md-input-container md-has-password>
                <md-icon>lock</md-icon>
                <label>Senha</label>
                <md-input type="password" required v-model="user.password" />
                </md-input-container>
            </md-card-content>

            <md-card-actions>
                <md-button v-on:click="adicionar(user)"  type="submit">Cadastrar</md-button>
            </md-card-actions>
            </md-layout>

        </md-layout>
    </div>
</template>
<script type="text/javascript">    
  import {Jwt} from './../services/resources';
  import mytoastHelper from './../helpers/toastHelper';

    export default {
        data(){
            return {
                user: {
                    username: '',
                    password:''
                },
                error: {
                    error: false,
                    message: ''
                }
            }
        },
        methods: {
            adicionar(user){
                mytoastHelper.newToast('Isso Ainda não Funciona! Aguarde o próximo commit.', 'error', 'warning');     
            }
        }
    }
</script>
<style scoped>
    .login{
        padding-top:50px;
    }
</style>