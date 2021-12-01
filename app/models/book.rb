# frozen_string_literal: true

class Book < ApplicationRecord
  include ExtendNestedAttributes
  include ExtendOrder
  include BelongsToUser
  include ModelToCsv
  include WebApiModel

  has_many :reviews, class_name: 'BookReview', dependent: :destroy
  accepts_nested_attributes_for :reviews, allow_destroy: true, auto_destroy: true

  belongs_to_user prefix: :create
  belongs_to_user prefix: :update

  order_names(
    update_user: ->(order){
      left_join_as(:update_user).order("update_user.name #{order} NULLS LAST")
    }
  )

  scope :search, ->(query){

    result = self

    if query.present?
      query.split(/[[:blank:]]/).each do |text|
        result = result.where('name ILIKE ?', "%#{sanitize_sql_like(text)}%")
      end
    end

    result
  }

end
