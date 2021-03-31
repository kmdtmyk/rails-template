# frozen_string_literal: true

class Order < ApplicationRecord
  include BelongsToUser
  include ExtendOrder
  include ExtendSearch
  include ModelToCsv
  include WebApiModel

  has_many :details, class_name: 'OrderDetail', dependent: :destroy
  accepts_nested_attributes_for :details, allow_destroy: true

  belongs_to_user prefix: :create
  belongs_to_user prefix: :update

  order_names(
    update_user: 'users.name'
  )

  scope :search, ->(params){

    result = self

    if params[:from_date].present? || params[:to_date].present?
      result = result.from_to_date_search(:date, params[:from_date], params[:to_date])
    end

    result
  }

  before_save do
    details.each(&:lookup_item)
    self.total_price = details.sum{ |detail| detail.total_price }
  end

end
