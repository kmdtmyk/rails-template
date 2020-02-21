# frozen_string_literal: true

module CoalesceAttribute
  extend ActiveSupport::Concern

  included do

    def coalesce_attribute(name, attributes)
      attributes.each do |attribute|

        value = read_attribute(attribute)
        if value.blank?
          next
        end

        write_attribute(name, value)
        return
      end

      write_attribute(name, nil)
    end

  end

end
