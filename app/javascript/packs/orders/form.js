import Vue from 'vue/dist/vue.esm'
import VueFields from '@kmdtmyk/vue-fields'
import OrderForm from './component/Form.vue'

Vue.use(VueFields, {inputClass: 'form-control'})

new Vue({
  el: '#app',
  components: {
    OrderForm,
  },
  data(){
    return {
      order: gon.order,
      items: gon.items,
    }
  },
})
