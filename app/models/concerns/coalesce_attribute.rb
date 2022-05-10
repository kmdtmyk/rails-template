# frozen_string_literal: true

module CoalesceAttribute
  extend ActiveSupport::Concern

  class_methods do

    # sqlのcoalesceと同じような動きをするカラム
    def coalesce_attribute(name, attributes)

      before_validation do
        write_attribute(name, CoalesceAttribute.read(self, attributes))
      end

      define_method name do
        CoalesceAttribute.read(self, attributes)
      end

    end

  end

  def self.read(object, attributes)
    attributes.each do |attribute|

      value = object.read_attribute(attribute)

      unless value.blank?
        return value
      end

    end

    return nil
  end

end
