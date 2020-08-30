class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_many_attached :image
  
end
