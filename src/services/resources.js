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

        return axios.post(GlobalKeys.getUrlBase()+'/token',params,  config);          
    }    
}

export class Evento{
    static novoEvento(evento){
    
        var config = GlobalKeys.headersPost();
        var userLogged = SessionStorage.getObject(GlobalKeys.getKeyUser());
        
        return axios.post(GlobalKeys.getUrlBase()+'/api/evento/novo', 
                { UsuarioId: userLogged.id, Nome: evento.nome, DataInicio: evento.dataInicio,
                    DataFim: evento.dataFim, HoraInicio: evento.horaInicio, HoraFim: evento.horaFim,
                    Descricao: evento.descricao, Cancelado: evento.cancelado  }, config
                );    
        };
    
    static excluirEvento(evento){      
                console.log('evento'+evento.id);      
                var config = GlobalKeys.headersPost();
                return axios.get(GlobalKeys.getUrlBase()+'/api/evento/delete?id='+evento.id, config);                   
            }  
        }


const Eventos = Vue.resource(GlobalKeys.getUrlBase()+'/api/evento/obtertodos');

export {Eventos};