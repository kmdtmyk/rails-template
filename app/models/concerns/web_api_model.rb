# frozen_string_literal: true

module WebApiModel
  extend ActiveSupport::Concern

  included do

    scope :web_api_index, ->(params){

      result = self

      if params[:q].present?
        result = WebApiModel.search(result, params[:q])
      end

      if params[:order].present?
        result = WebApiModel.order(result, params[:order])
      else
        result.order(:id)
      end

      result
        .page(params[:page])
        .per(params[:per])
    }

  end

  class << self

    # <name><operator><value>の形式で文字列を渡すとその条件で検索する
    # 存在しないフィールドが指定された場合は無視する
    def search(relation, query)
      result = relation
      if query.blank?
        result
      end

      model_class = relation.model

      parse_query(query).each do |param|
        next unless model_class.has_attribute?(param[:name])
        result = result.where("#{param[:name]} #{param[:operator]} ?", param[:value])
      end

      result
    end

    # 'name' → name昇順
    # '-name' → name降順
    # 'name,created_at' → 複合ソート
    def order(relation, order)
      result = relation

      orders = parse_order(order)

      orders.each do |hash|
        result = result.order({hash[:sort] => hash[:order]})
      end

      unless orders.any?{ |hash| hash[:sort] == 'id' }
        result = result.order(:id)
      end

      result
    end

    def parse_query(text)
      if text.blank?
        return []
      end

      text.split(/[[:blank:]]+/).map do |word|
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