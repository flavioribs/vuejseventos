import Vue from 'vue';
import VueResource from 'vue-resource';

Vue.use(VueResource);
require('./interceptors');

export class Jwt{
    static accessToken(username, password){
        return Vue.http.post('http://eventosapi.azurewebsites.net/token', {
            username : username, password : password
        }, {headers: {'Content-Type' : 'application/json'}});
    }    
}

const Eventos = Vue.resource('http://eventosapi.azurewebsites.net/api/evento/obtertodos');

export {Eventos};