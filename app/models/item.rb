# frozen_string_literal: true

class Item < ApplicationRecord
  include ExtendOrder
  include BelongsToUser
  include SearchCop
  include SetSearchText

  belongs_to_user prefix: :create
  belongs_to_user prefix: :update

  order_names(
    create_user: { create_user: :name },
    update_user: { update_user: :name },
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

  before_save do
    set_search_text(
      name: :search_name,
      furigana: :search_furigana,
    )
  end

end
