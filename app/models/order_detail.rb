# frozen_string_literal: true

class OrderDetail < ApplicationRecord
  include CalculationAttribute

  belongs_to :item, optional: true

  calculation_attribute :total_price, ->{
    (item_price || 0) * (quantity || 0)
  }

  def lookup_item
    self.item_name = item&.name
  end

end
