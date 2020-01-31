import Vue from 'vue/dist/vue.esm'
import OrderForm from './component/Form.vue'

new Vue({
  el: '#app',
  components: {
    OrderForm,
  },
  data(){
    return {
      order: gon.order
    }
  },
})
