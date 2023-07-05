class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit,]
  before_action :set_item, only: [:show, :edit, :update]

  
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
  end

  def edit
    return unless current_user != @item.user
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :delivery_charge_id,
                                 :prefecture_id, :ship_date_id, :price).merge(user_id: current_user.id)
  end
end
