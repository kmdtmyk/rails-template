# frozen_string_literal: true

module ExtendOrder
  extend ActiveSupport::Concern

  included do

    scope :safe_order, -> (name, order = 'asc') {

      name = name.to_s.downcase

      return unless model.attribute_names.include? name

      sort = "#{model.table_name}.#{name}"

      if 'asc'.casecmp? order.to_s
        order("#{sort} ASC NULLS LAST")
      elsif 'desc'.casecmp? order.to_s
        order("#{sort} DESC NULLS LAST")
      end
    }

  end

  module ClassMethods

    def order_names(hash)

      hash = HashWithIndifferentAccess.new(hash)

      scope :order_by, -> (sort, order = 'asc'){
        if 'asc'.casecmp? order.to_s
          order = 'ASC'
        elsif 'desc'.casecmp? order.to_s
          order = 'DESC'
        else
          return self
        end

        sort_column = hash[sort]

        if sort_column.present?
          order("#{sort_column} #{order} NULLS LAST")
        else
          safe_order(sort, order)
        end
      }

    end

  end

end
