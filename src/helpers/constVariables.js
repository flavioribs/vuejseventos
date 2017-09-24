
import SessionStorage from './../services/session-storage';

export default {
    getKeyToken(){
        return 'appeventostoken';
    },
    getKeyUser(){
        return 'appeventosuserlogged';
    },
    getUrlBase(){
        return 'http://eventosapi.azurewebsites.net';
        //return 'http://localhost:57286';
    },
    headersPost(){
        var config = {
            headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer ' 
            + SessionStorage.getToken('appeventostoken')}
       };

       return config;
    }
}