# frozen_string_literal: true

class Book < ApplicationRecord
  include ExtendNestedAttributes
  include ExtendOrder
  include ModelToCsv

  has_many :reviews, class_name: 'BookReview', dependent: :destroy
  accepts_nested_attributes_for :reviews, allow_destroy: true, auto_destroy: true

  scope :search, -> (query) {

    result = self

    if query.present?
      query.split(/[[:blank:]]/).each do |text|
        result = result.where('name ILIKE ?', "%#{sanitize_sql_like(text)}%")
      end
    end

    result
  }

end
