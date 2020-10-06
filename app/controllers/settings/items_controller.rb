# frozen_string_literal: true

class Settings::ItemsController < BaseController
  include StreamingDownload

  before_action :apply_rparam
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @items = Item
      .search(params)
      .order_by(params[:sort])
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.created_by(current_user)
    if @item.save
      redirect_to_params_referrer_or url_for(action: :index), notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    @item.updated_by(current_user)
    if @item.update(item_params)
      redirect_to_params_referrer_or url_for(action: :index), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to_back notice: 'Item was successfully destroyed.'
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(
        :name,
        :furigana,
        :price,
      )
    end

end
