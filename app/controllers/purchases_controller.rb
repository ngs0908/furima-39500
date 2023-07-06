class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  def index
    @purchase_address = PurchaseAddress.new
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def purchase_address_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipality, :house_number, :house_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  private

  # def purchase_params
  #   params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipality, :address, :house_number, :house_name, :phone_number, :user_id).merge(user_id: current_user.id)
  # end

end