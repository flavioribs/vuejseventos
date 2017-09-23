import Vue from 'vue';
import VueResource from 'vue-resource';
import axios from 'axios';

Vue.use(VueResource);
require('./interceptors');


export class Jwt{
    static accessToken(username, password){
       var config = {
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
       };
        var params = new URLSearchParams();
        params.append('username', username);
        params.append('password', password);

        return axios.post('http://eventosapi.azurewebsites.net/token',params,  config);          
    }    
}

export class Evento{
    static novoEvento(evento){
       var config = {
            headers: {'Content-Type': 'application/json'}
       };
       axios.post('http://eventosapi.azurewebsites.net/api/evento/novo', 
        { Nome: this.usuario.Nome, UserName : this.usuario.UserName,
          Senha : this.usuario.Senha, Email : this.usuario.Email }, config
        );    
    }    
}

const Eventos = Vue.resource('http://eventosapi.azurewebsites.net/api/evento/obtertodos');

export {Eventos};