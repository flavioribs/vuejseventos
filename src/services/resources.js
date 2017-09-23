import Vue from 'vue';
import VueResource from 'vue-resource';
import axios from 'axios';
import GlobalKeys from './../helpers/constVariables';
import SessionStorage from './session-storage';

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
            headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer ' 
            + SessionStorage.getToken(GlobalKeys.getKeyToken())}
       };
    return axios.post('http://eventosapi.azurewebsites.net/api/evento/novo', 
            { UsuarioId: 2, Nome: evento.nome, DataInicio: evento.dataInicio,
            DataFim: evento.dataFim, HoraInicio: evento.horaInicio, HoraFim: evento.horaFim,
            Descricao: evento.descricao, Cancelado: evento.cancelado  }, config
            );    
    }    
}

const Eventos = Vue.resource('http://eventosapi.azurewebsites.net/api/evento/obtertodos');

export {Eventos};