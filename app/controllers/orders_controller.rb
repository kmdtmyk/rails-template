# frozen_string_literal: true

class OrdersController < BaseController
  before_action :apply_rparam

  def index
    @orders = Order
      .search(params)
      .order_by(params[:sort], params[:order])
  end

  def new
    @order = Order.new(
      date: Time.zone.today,
    )
    set_gon
  end

  def edit
    @order = Order.find(params[:id])
    set_gon
  end

  def create
    @order = Order.new(order_params)
    @order.created_by(current_user)
    if @order.save
      redirect_to_params_referrer_or url_for(action: :index), notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.updated_by(current_user)
    if @order.update(order_params)
      redirect_to_params_referrer_or url_for(action: :index), notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to_back notice: 'Order was successfully destroyed.'
  end

  private

    def order_params
      result = params.require(:order).permit(
        :date,
        :comment,
        details_attributes: [
          :id,
          :item_id,
          :item_name,
          :item_price,
          :quantity,
          :_destroy,
        ]
      )

      result[:details_attributes].each do |index, detail|
        if detail[:item_id].blank? && detail[:quantity].blank?
          detail[:_destroy] = true
        end
      end

      result
    end

    def set_gon
      order = if @order.new_record?
        @order
      else
        Order.includes(details: :item).find(@order.id)
      end
      gon.order = ActiveModelSerializers::SerializableResource.new(
        order, serializer: OrderSerializer, include: [{details: :item}]
      )
    end

end
