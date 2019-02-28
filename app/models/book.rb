# frozen_string_literal: true

class Book < ApplicationRecord

  scope :search, -> (query) {
    if query.present?
      where('name LIKE ?', "%#{sanitize_sql_like(query)}%")
    end
  }

end
