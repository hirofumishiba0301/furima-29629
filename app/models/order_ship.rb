class OrderShip

  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :phone_number, :address, :city
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, length: { maximum: 11 }
  end
  
  def save
    order = Order.create
    Ship.create(order_id: order.id, prefecture_id: prefecture_id, city: city, address: address, building: building, postal_code: postal_code, phone_number: phone_number)
  end
end
