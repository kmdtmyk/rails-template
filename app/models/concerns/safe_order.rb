# frozen_string_literal: true

module SafeOrder
  extend ActiveSupport::Concern

  included do

    scope :safe_order, -> (name, order) {
      return unless %w(asc desc).include? order
      return unless model.attribute_names.include?(name)
      order("#{name} #{order}")
    }

  end

end
