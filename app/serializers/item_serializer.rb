# frozen_string_literal: true

class ItemSerializer < ActiveModel::Serializer

  attributes(
    :id,
    :name,
    :furigana,
    :price,
  )

end
