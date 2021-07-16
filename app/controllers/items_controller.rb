class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit]
  before_action :froce_redirect_unless_my_item, only: [:edit, :update, :destroy]
  def index
    @items = Item.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:item_info,:item_category_id,:item_sales_status_id,:item_shipping_fee_status_id,:item_prefecture_id,:item_scheduled_delivery_id,:item_price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def froce_redirect_unless_my_item
    if @item.user != current_user
      redirect_to root_path
    end
  end

  def move_to_index
    if @item.order.present?
      redirect_to root_path
    end
  end
end
