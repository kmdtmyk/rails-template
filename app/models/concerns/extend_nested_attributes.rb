# frozen_string_literal: true

module ExtendNestedAttributes
  extend ActiveSupport::Concern

  class_methods do

    # Add option auto_destroy to accepts_nested_attributes_for
    def accepts_nested_attributes_for(*attr_names)
      options = attr_names.extract_options!
      auto_destroy = options.delete :auto_destroy

      super(*attr_names, options)

      attr_names.each do |name|

        define_method("#{name}_attributes=") do |attributes|

          if self.new_record?
            attributes.each do |attribute|
              attribute.delete(:id)
            end
          end

          if auto_destroy
            destroy_ids = send(name).ids - attributes.pluck(:id)
            destroy_attributes = destroy_ids.map do |id|
              { id: id, _destroy: true }
            end

            attributes = attributes + destroy_attributes
          end

          super(attributes)
        end

      end

    end

  end

end
