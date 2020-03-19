# frozen_string_literal: true

module CalculationAttribute
  extend ActiveSupport::Concern

  class_methods do

    def calculation_attribute(name, proc)
      before_validation do
        value = instance_exec(&proc)
        write_attribute(name, value)
      end
    end

  end

end
