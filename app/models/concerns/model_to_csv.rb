# frozen_string_literal: true

require 'csv'

module ModelToCsv
  extend ActiveSupport::Concern

  included do

    scope :to_csv, -> {
      names = self.model.attribute_names

      options = {
        headers: names,
        write_headers: true,
        force_quotes: true,
      }

      CSV.generate(options) do |csv|
        each do |record|
          csv << names.map do |name|
            record.read_attribute name
          end
        end
      end
    }

  end

end
