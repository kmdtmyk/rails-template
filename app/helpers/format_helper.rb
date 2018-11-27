# frozen_string_literal: true

module FormatHelper

  def format_date(date, format = '%Y/%m/%d')
    return if date.nil?
    date.strftime(format)
  end

  def format_datetime(datetime, format = '%Y/%m/%d %H:%M:%S')
    return if datetime.nil?
    datetime.strftime(format)
  end

  def format_number(number)
    return if number.nil?
    number_with_delimiter number
  end

end
