class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new]
  def index
    #@item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:item_info,:item_category_id,:item_sales_status_id,:item_shipping_fee_status_id,:item_prefecture_id,:item_scheduled_delivery_id,:item_price,:image).merge(user_id: current_user.id)
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to  new_user_session_path
    end
  end
end
