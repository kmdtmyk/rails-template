# frozen_string_literal: true

class OrderDetail < ApplicationRecord
  include CalculationAttribute

  belongs_to :item, optional: true

  calculation_attribute :total_price, ->{
    if item_price.present? && quantity.present?
      item_price * quantity
    end
  }

  def lookup_item
    self.item_name = item&.name
  end

end
