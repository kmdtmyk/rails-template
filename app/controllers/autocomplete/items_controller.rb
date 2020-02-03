# frozen_string_literal: true

class Autocomplete::ItemsController < BaseController

  def index
    items = Item
      .search(params)
      .order_by(params[:sort], params[:order])
      .page(params[:page])
      .per(params[:per])

    render json: items
  end

end
