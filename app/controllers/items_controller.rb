class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:show]

  def new
    @item = Item.new
  end

  def index
    @items = Item.all.order('created_at DESC')
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path, notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

def show
  @user = @item.user
  
  if user_signed_in? && user_check
    @editable = true
  end
end

  def edit
    if current_user != @item.user || @item.sold_out?
      redirect_to root_path and return
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
    return unless current_user != @item.user
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :delivery_charge_id,
                                 :prefecture_id, :ship_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

  def user_check
    current_user == @item.user
  end
