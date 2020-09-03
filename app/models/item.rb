class Item < ApplicationRecord
  with_options presence: true do
    validates :item
    validates :explanation
    validates :price,         numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください。' }
    validates :price,         numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は範囲内で入力してください。' }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_id
      validates :area_id
      validates :day_id
    end
  end

  belongs_to :user
  has_one    :purchase
  has_one_attached :image
end
