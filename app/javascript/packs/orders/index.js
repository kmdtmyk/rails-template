import RubyDate from '@kmdtmyk/ruby-date'

const fromDate = document.querySelector(`[name=from_date]`)
const toDate = document.querySelector(`[name=to_date]`)

document.querySelector(`[name=date_today]`).addEventListener('click', (e) => {
  const today = RubyDate.today()
  fromDate.value = today
  toDate.value = today
})

document.querySelector(`[name=date_week]`).addEventListener('click', (e) => {
  const today = RubyDate.today()
  fromDate.value = today.nextDay(-7)
  toDate.value = today
})

document.querySelector(`[name=date_month]`).addEventListener('click', (e) => {
  const today = RubyDate.today()
  fromDate.value = today.nextMonth(-1)
  toDate.value = today
})
