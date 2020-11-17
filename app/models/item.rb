class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sale
  belongs_to_active_hash :scheduled
  belongs_to_active_hash :shipping
  has_one_attached :image 

  validates :name,:image,:info,:category,:sale,:shipping,:prefecture,:scheduled, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :sale_id, numericality: { other_than: 1 } 
  validates :shipping_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :scheduled_id, numericality: { other_than: 1 } 
  validates :price, presence: true,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
