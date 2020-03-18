# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'WebApi.index' do

    example 'number' do
      expect(Order::WebApi.index(q: 'id:1').to_sql).to start_with(
        Order.where(id: 1).to_sql
      )
      expect(Order::WebApi.index(q: '-id:1').to_sql).to start_with(
        Order.where.not(id: 1).to_sql
      )
    end

    example 'string' do
      expect(Order::WebApi.index(q: 'comment:"foo"').to_sql).to start_with(
        Order.where(comment: 'foo').to_sql
      )
      expect(Order::WebApi.index(q: '-comment:"foo"').to_sql).to start_with(
        Order.where.not(comment: 'foo').to_sql
      )
    end

    example 'array' do
      expect(Order::WebApi.index(q: 'id:[1,2,3]').to_sql).to start_with(
        Order.where(id: [1, 2, 3]).to_sql
      )
      expect(Order::WebApi.index(q: '-id:[1,2,3]').to_sql).to start_with(
        Order.where.not(id: [1, 2, 3]).to_sql
      )
    end

    example 'null' do
      expect(Order::WebApi.index(q: 'id:null').to_sql).to start_with(
        Order.where(id: nil).to_sql
      )
      expect(Order::WebApi.index(q: '-id:null').to_sql).to start_with(
        Order.where.not(id: nil).to_sql
      )
    end

    example 'multiple' do
      expect(Order::WebApi.index(q: 'id:1 comment:"foo"').to_sql).to start_with(
        Order.where(id: 1).where(comment: 'foo').to_sql
      )
    end

  end

end
