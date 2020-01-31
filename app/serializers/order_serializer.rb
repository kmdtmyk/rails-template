# frozen_string_literal: true

class OrderSerializer < ActiveModel::Serializer

  attributes(
    :id,
    :date,
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
  end

end
