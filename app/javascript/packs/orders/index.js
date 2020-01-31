import Midnight from '@kmdtmyk/midnight'
import dateformat from 'dateformat'

const fromToDate = (name) => {

  const fromDate = document.querySelector(`[name=from_${name}]`)
  const toDate = document.querySelector(`[name=to_${name}]`)

  const setValue = (input, date) => {
    input.value = dateformat(date, 'yyyy-mm-dd')
  }

  document.querySelector(`[name=${name}_today]`).addEventListener('click', (e) => {
    const today = Midnight.today()
    setValue(fromDate, today)
    setValue(toDate, today)
  })

  document.querySelector(`[name=${name}_week]`).addEventListener('click', (e) => {
    const today = Midnight.today()
    setValue(fromDate, today.nextDay(-7))
    setValue(toDate, today)
  })

  document.querySelector(`[name=${name}_month]`).addEventListener('click', (e) => {
    const today = Midnight.today()
    setValue(fromDate, today.nextMonth(-1))
    setValue(toDate, today)
  })

}

fromToDate('date')
