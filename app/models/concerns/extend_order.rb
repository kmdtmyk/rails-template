# frozen_string_literal: true

module ExtendOrder
  extend ActiveSupport::Concern

  included do

    scope :safe_order, ->(name, order = 'asc'){

      name = name.to_s.downcase

      return unless model.attribute_names.include? name

      sort = "#{model.table_name}.#{name}"

      if 'asc'.casecmp? order.to_s
        order("#{sort} ASC NULLS LAST")
      elsif 'desc'.casecmp? order.to_s
        order("#{sort} DESC NULLS LAST")
      end
    }

    scope :left_join_as, ->(name){
      reflection = model.reflect_on_association(name)
      joins(
        "LEFT OUTER JOIN \"#{reflection.table_name}\" \"#{name}\" " +
        "ON \"#{name}\".\"id\" = \"#{table_name}\".\"#{reflection.foreign_key}\""
      )
    }

    order_names({})

  end

  module ClassMethods

    def order_names(hash)

      hash = HashWithIndifferentAccess.new(hash)

      scope :order_by, ->(sort){
        result = self

        if sort.nil?
          return result
        end

        sort.split(',').each do |sort|

          order = if sort.start_with?('-')
            sort = sort.delete_prefix('-')
            'DESC'
          else
            'ASC'
          end

          sort_column = hash[sort]

          if sort_column.nil?
            result = result.safe_order(sort, order)
          elsif sort_column.is_a? Hash
            sort_column.each do |table, column|
              result = result
                .left_join_as(table)
                .order("\"#{table}\".\"#{column}\" #{order} NULLS LAST")
            end
          elsif sort_column.is_a? Array
            sort_column.each do |column|
              result = result.safe_order(column, order)
            end
          else
            result = result.order("#{sort_column} #{order} NULLS LAST")
          end

        end

        result
      }

    end

  end

end
