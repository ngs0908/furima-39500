class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def index
    
  end

  def create
    @item = Item.new(item_params)
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :ship_date_id, :price)
  end
end
