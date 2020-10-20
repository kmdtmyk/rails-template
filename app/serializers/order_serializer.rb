# frozen_string_literal: true

class OrderSerializer < ActiveModel::Serializer

  attributes(
    :id,
    :date,
    :comment,
  )

  has_many :details

  class OrderDetailSerializer < ActiveModel::Serializer

    attributes(
      :id,
      :item_id,
      :item_name,
      :item_price,
      :quantity,
      :total_price,
    )

    has_one :item

    class ItemSerializer < ActiveModel::Serializer
      attributes(
        :id,
        :name,
        :furigana,
        :price,
      )
    end

  end

end
