<template lang='pug'>
SelectField(
  record-key='id'
  v-bind='$attrs'
  v-on='listeners'
  :value='value'
  :records='records'
  :record.sync='record'
  :async-wait='200'
)
  template(v-slot='{record}')
    span {{record.name}}
</template>

<script>
import axios from 'axios'

export default {
  model: {
    prop: 'value',
  },
  props: [
    'value',
    'item',
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
  computed: {
    listeners(){
      return {
        ...this.$listeners,
        input: this.onInput,
      }
    },
    record: {
      get(){
        return this.item
      },
      set(item){
        this.$emit('update:item', item)
      },
    },
  },
  methods: {
    onInput(id){
      this.$emit('input', id)
    }
  },
}
</script>
