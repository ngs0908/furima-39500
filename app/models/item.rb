class Item < ApplicationRecord
  has_one :purchase
  belongs_to :user
  has_one_attached :image

  validates :item_name , :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :ship_date_id, :price, presence: true
end
