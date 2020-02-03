<template lang='pug'>
SelectField(
  record-key='id'
  v-bind='$attrs'
  :value='value'
  :records='records'
  :async-wait='200'
  @input='onInput'
)
  template(v-slot='{record}')
    span {{record.name}} / ({{record.price | number}})
</template>

<script>
import axios from 'axios'

export default {
  model: {
    prop: 'value',
  },
  props: [
    'value',
  ],
  filters: {
    number(value){
      if(value == null){
        return ''
      }
      return value.toLocaleString()
    },
  },
  data(){
    return {
      records: async (query) => {
        if(query == null){
          return []
        }
        const result = await axios.get(`/autocomplete/items?q=${query}`)
        return result.data
      }
    }
  },
  methods: {
    onInput(id){
      this.$emit('input', id)
    }
  },
}
</script>
