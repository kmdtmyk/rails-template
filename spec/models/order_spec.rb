# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'WebApi.index' do

    example 'number' do
      expect(Order::WebApi.index(q: 'id:1').to_sql).to start_with Order.where(id: 1).to_sql
      expect(Order::WebApi.index(q: '-id:1').to_sql).to start_with Order.where.not(id: 1).to_sql
    end

    example 'null' do
      expect(Order::WebApi.index(q: 'id:null').to_sql).to start_with Order.where(id: nil).to_sql
      expect(Order::WebApi.index(q: '-id:null').to_sql).to start_with Order.where.not(id: nil).to_sql
    end

  end

end
