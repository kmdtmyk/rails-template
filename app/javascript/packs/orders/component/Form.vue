<template lang='pug'>
div
  .form-row
    .form-group
      label Date
      div
        DateField(v-model='order.date' name='order[date]')
  table.table.table-hover.table-responsive
    thead
      tr
        th item
        th quantity
        th
          button.btn.btn-info(type='button' @click='add') 追加
    tbody
      tr(v-for='(detail, index) in order.details' :style='{display: detail._destroy ? "none": ""}')
        td
          select.form-control(
            v-model='detail.itemId'
            :name='`order[details_attributes][${index}][item_id]`')
            option
            option(v-for='item in items' :value='item.id')
              |{{item.name}} / ({{item.price | number}})
        td
          IntegerField(
            v-model='detail.quantity'
            :name='`order[details_attributes][${index}][quantity]`')
        td
          button.btn.btn-warning(type='button' @click='remove(detail)') 削除
          input(
            type='hidden'
            :name='`order[details_attributes][${index}][id]`'
            :value='detail.id'
          )
          input(
            type='hidden'
            :name='`order[details_attributes][${index}][_destroy]`'
            :value='detail._destroy'
          )
</template>

<script>
export default {
  model: {
    prop: 'order',
  },
  props: {
    order: Object,
    items: Array,
  },
  filters: {
    number(value){
      if(value == null){
        return ''
      }
      return value.toLocaleString()
    },
  },
  mounted(){
    console.log(this)
  },
  methods: {
    add(){
      this.order.details.push({})
    },
    remove(detail){
      this.$set(detail, '_destroy', 1)
    },
  },
}
</script>
