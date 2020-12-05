class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sale
  belongs_to_active_hash :scheduled
  belongs_to_active_hash :shipping
  has_one_attached :image

  validates :name, :image, :info, :category, :sale, :shipping, :prefecture, :scheduled, presence: true
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sale_id
    validates :shipping_id
    validates :prefecture_id
    validates :scheduled_id
  end
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
