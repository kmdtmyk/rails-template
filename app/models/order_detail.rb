# frozen_string_literal: true

class OrderDetail < ApplicationRecord

  belongs_to :item, optional: true

  def lookup_item
    self.item_name = item&.name
    self.item_price = item&.price
    self.total_price = (item_price || 0) * (quantity || 0)
  end

end
