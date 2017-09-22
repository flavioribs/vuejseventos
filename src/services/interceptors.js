import Vue from 'vue';
import SessionStorage from './session-storage';

Vue.http.interceptors.push((request, next) => {
    request.headers.set('Authorization', SessionStorage.getAuthorizationHeader());
    
    next();
});