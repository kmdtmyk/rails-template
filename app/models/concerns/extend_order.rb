# frozen_string_literal: true

module ExtendOrder
  extend ActiveSupport::Concern

  included do

    scope :safe_order, -> (name, order = 'asc') {

      name = name.to_s.downcase

      return unless model.attribute_names.include? name

      sort = "#{model.table_name}.#{name}"

      if 'asc'.casecmp? order.to_s
        order("#{sort} ASC")
      elsif 'desc'.casecmp? order.to_s
        order("#{sort} DESC")
      end
    }

  end

end
