class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new

    if user_signed_in?
      redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_address_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:price, :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,                   # 商品の値段
      card: order_address_params[:token], # カードトークン
      currency: 'jpy'                         # 通貨の種類(日本円)
    )
  end
end
