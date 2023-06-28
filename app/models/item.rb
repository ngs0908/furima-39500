class Item < ApplicationRecord
  has_one :purchase
  belongs_to :user
  has_one_attached :image

  validates :image, :item_name , :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :ship_date_id, :price, presence: true
  validates :price, presence: true,
    numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    only_integer: true
  }
end
