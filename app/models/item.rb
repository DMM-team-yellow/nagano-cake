class Item < ApplicationRecord
  
  has_one_attached :image
  
  has_many :cart_items, dependent: :destroy
  
  belongs_to :genre
  
  has_many :order_items
  has_many :orders, through: :order_items
 
end
