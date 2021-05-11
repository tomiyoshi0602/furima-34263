class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  

  def index
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end

  def move_to_index
    item = Item.find(params[:item_id])
    unless current_user.id == item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = "sk_test_416fd2c582adc856cb36fde0"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
