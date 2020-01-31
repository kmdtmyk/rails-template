# frozen_string_literal: true

class Item < ApplicationRecord
  include ExtendOrder
  include BelongsToUser
  include SearchCop

  belongs_to_user prefix: :create
  belongs_to_user prefix: :update

  order_by(
    update_user: 'users.name'
  )

  search_scope :search_scope do
    attributes :name, :furigana
  end

  scope :search, -> (params) {
    result = self

    if params[:q].present?
      result = search_scope(params[:q])
    end

    result
  }

end
