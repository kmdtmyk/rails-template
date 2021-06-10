# frozen_string_literal: true

class OrdersParameter < Rparam::Parameter

  def index
    param :from_date, type: Date, save: :relative_date
    param :to_date, type: Date, save: :relative_date
    param :sort, save: true
  end

end
