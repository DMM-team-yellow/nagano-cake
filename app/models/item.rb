class Item < ApplicationRecord
  
  has_one_attached :image
  
  has_many :cart_items, dependent: :destroy
  
  belongs_to :genre
  
  has_many :order_items
  has_many :orders, through: :order_items
  
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
end
