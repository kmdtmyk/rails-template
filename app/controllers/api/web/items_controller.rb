# frozen_string_literal: true

class Api::Web::ItemsController < Api::Web::BaseController

  def index
    items = Item
      .search(params)
      .order_by(params[:sort])
      .page(params[:page])
      .per(params[:per])

    render json: items
  end

end
