<template>
    <div class="login">
        <md-layout md-tag="form" md-align="center" novalidate >
            <md-layout md-tag="md-card" md-column md-flex="30" md-flex-medium="40" md-flex-small="60" md-flex-xsmall="90" class="md-primary">
            <md-card-header>
                <div class="md-title">Acesso</div>
            </md-card-header>

            <md-card-content>
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
                <md-button v-on:click="login(user)"  type="submit">Acessar</md-button>
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