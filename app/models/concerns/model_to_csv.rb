# frozen_string_literal: true

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

    def to_csv
      options = {
        write_headers: false,
        force_quotes: true,
      }
      CSV.generate(options) do |csv|
        csv << attribute_names.map do |name|
          read_attribute name
        end
      end.strip
    end

  end

end
