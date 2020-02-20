require 'rails_helper'

RSpec.describe WebApiModel do

  describe 'parse_query' do

    example 'basic' do

      expect(WebApiModel.parse_query('id:5')).to eq [
        { name: 'id', operator: '=', value: '5' },
      ]

      expect(WebApiModel.parse_query('id:>5')).to eq [
        { name: 'id', operator: '>', value: '5' },
      ]

      expect(WebApiModel.parse_query('id:>=5')).to eq [
        { name: 'id', operator: '>=', value: '5' },
      ]

      expect(WebApiModel.parse_query('id:<5')).to eq [
        { name: 'id', operator: '<', value: '5' },
      ]

      expect(WebApiModel.parse_query('id:<=5')).to eq [
        { name: 'id', operator: '<=', value: '5' },
      ]

      expect(WebApiModel.parse_query('id:')).to eq [
        { name: 'id', operator: '=', value: '' },
      ]

      expect(WebApiModel.parse_query('updated_at:>2019-05-15')).to eq [
        { name: 'updated_at', operator: '>', value: '2019-05-15' },
      ]

      expect(WebApiModel.parse_query('updated_at:>2019-08-27T18:09:48.073+09:00')).to eq [
        { name: 'updated_at', operator: '>', value: '2019-08-27T18:09:48.073+09:00' },
      ]

    end

    example 'multiple' do
      expect(WebApiModel.parse_query('name:foo id:>5')).to eq [
        { name: 'name', operator: '=', value: 'foo' },
        { name: 'id', operator: '>', value: '5' },
      ]

      expect(WebApiModel.parse_query('name:foo　id:>5')).to eq [
        { name: 'name', operator: '=', value: 'foo' },
        { name: 'id', operator: '>', value: '5' },
      ]
    end

    example 'empty' do
      expect(WebApiModel.parse_query('')).to eq []
      expect(WebApiModel.parse_query(' ')).to eq []
      expect(WebApiModel.parse_query(nil)).to eq []
    end

  end

  describe 'parse_order' do

    example 'basic' do
      expect(WebApiModel.parse_order('name')).to eq [
        { sort: 'name', order: 'asc' },
      ]

      expect(WebApiModel.parse_order('-name')).to eq [
        { sort: 'name', order: 'desc' },
      ]
    end

    example 'multiple' do
      expect(WebApiModel.parse_order('name,id')).to eq [
        { sort: 'name', order: 'asc' },
        { sort: 'id', order: 'asc' },
      ]
    end

    example 'empty' do
      expect(WebApiModel.parse_order('')).to eq []
      expect(WebApiModel.parse_order(' ')).to eq []
      expect(WebApiModel.parse_order(nil)).to eq []
    end

  end

end
