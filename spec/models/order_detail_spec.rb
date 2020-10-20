# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderDetail, type: :model do

  describe 'total_price' do

    example do
      order_detail = OrderDetail.new
      expect(order_detail.total_price).to eq nil
      order_detail.item_price = 100
      order_detail.quantity = 3
      expect(order_detail.total_price).to eq 300
      order_detail.quantity = 5
      expect(order_detail.total_price).to eq 500
    end

  end

end
