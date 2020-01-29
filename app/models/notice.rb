# frozen_string_literal: true

class Notice < ApplicationRecord
  include SearchCop
  include ExtendOrder
  include BelongsToUser

  belongs_to_user prefix: :create
  belongs_to_user prefix: :update

  search_scope :search_scope do
    attributes :title, :body
  end

  scope :search, -> (params) {
    result = self

    if params[:q].present?
      result = search_scope(params[:q])
    end

    result
  }

end
