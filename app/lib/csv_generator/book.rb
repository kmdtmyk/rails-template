# frozen_string_literal: true

class CsvGenerator::Book < CsvGenerator::Base
  include FormatHelper

  def headers
    [
      'id',
      'name',
      'price',
      'release_date',
      'created_at',
      'updated_at',
    ]
  end

  def ids_to_a(ids)
    Book.find(ids).map do |book|
      [
        book.id,
        book.name,
        book.price,
        book.release_date,
        format_datetime(book.created_at),
        format_datetime(book.updated_at),
      ]
    end
  end

end
