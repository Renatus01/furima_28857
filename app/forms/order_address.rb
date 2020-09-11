class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  validates :token, presence: true

  with_options presence: true do
    validates :postal_code,      format:       { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Included hyphen(-)' }
    validates :prefecture_id,    numericality: { other_than: 1,             message: 'Select' }
    validates :city
    validates :house_number
    validates :phone_number, numericality: { with: /\A\d{11}\z/, message: 'is invalid. Not included hyphen(-)' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
