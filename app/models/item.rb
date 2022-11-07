# frozen_string_literal: true

class Item < ApplicationRecord
  include ExtendOrder
  include BelongsToUser
  include SearchAttribute
  include SearchCop

  belongs_to_user prefix: :create
  belongs_to_user prefix: :update

  order_names(
    update_user: ->(order){
      left_join_as(:update_user)
        .order("update_user.name #{order}")
    },
  )

  search_scope :keyword_search do
    attributes :search_name, :search_furigana
  end

  scope :search, ->(params){
    result = self

    if params[:q].present?
      result = result.keyword_search(SearchText.normalize(params[:q]))
    end

    result
  }

  search_attribute(
    name: :search_name,
    furigana: :search_furigana,
  )

end
