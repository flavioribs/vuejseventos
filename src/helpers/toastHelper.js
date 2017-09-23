import Vue from 'vue'
import Toasted from 'vue-toasted';

Vue.use(Toasted)

export default {
    newToast(msg, msgType, msgIcon){
        Vue.toasted.show(msg, {  type : msgType,  icon : msgIcon, duration: 5000});            
    }
}