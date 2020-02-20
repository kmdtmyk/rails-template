# frozen_string_literal: true

module WebApiModel
  extend ActiveSupport::Concern

  included do

    scope :web_api_index, ->(params){

      result = self

      if params[:q].present?
        result = result.web_api_search(params[:q])
      end

      if params[:order].present?
        result = result.web_api_order(params[:order])
      else
        result.order(:id)
      end

      result
        .page(params[:page])
        .per(params[:per])
    }


    # <name><operator><value>の形式で文字列を渡すとその条件で検索する
    # 存在しないフィールドが指定された場合は無視する
    scope :web_api_search, ->(query){
      return if query.blank?
      result = self
      params = WebApiModel.parse_query(query)
      params.each do |param|
        next unless has_attribute?(param[:name])
        result = result.where("#{param[:name]} #{param[:operator]} ?", param[:value])
      end
      result
    }

    # 'name' → name昇順
    # '-name' → name降順
    # 'name,created_at' → 複合ソート
    scope :web_api_order, ->(order){
      result = self

      orders = WebApiModel.parse_order(order)

      orders.each do |hash|
        result = result.order({hash[:sort] => hash[:order]})
      end

      unless orders.any?{ |hash| hash[:sort] == 'id' }
        result = result.order(:id)
      end

      result
    }

  end

  class << self

    def parse_query(query)
      if query.blank?
        return []
      end

      query.split(/[[:blank:]]+/).map do |word|
        match = /((?<name>[^:]+)[:](?<operator>[<>=]*))?(?<value>.*)/.match(word)
        name = match[:name]
        operator = match[:operator]
        operator = '=' unless operator.in? %w(< > <= >=)
        value = match[:value]
        {
          name: name,
          operator: operator,
          value: value,
        }
      end

    end

    def parse_order(text)
      if text.blank?
        return []
      end

      text.split(',').map do |value|
        if value.start_with?('-')
          { sort: value.delete_prefix('-'), order: 'desc' }
        else
          { sort: value, order: 'asc' }
        end
      end
    end

    def parse_include(text)
      if text.blank?
        return []
      end

      text.split(',').map do |value|
        value.split('.').reverse.reduce({}) do |hash, name|
          { name.to_sym => hash }
        end
      end
    end

  end

end
