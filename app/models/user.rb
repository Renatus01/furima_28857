class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nickname
    with_options                   format: { with: /\A[ぁ-んァ-ン一-龥]/,                    message: "は全角で入力してください。"} do
      validates :first_name
      validates :last_name
    end
    with_options                   format: { with: /\A[ァ-ヶー－]+\z/,                       message: "は全角カタカナで入力して下さい。"} do
      validates :first_name_reading
      validates :last_name_reading
    end
    validates :birthday
  end

    validates :password,           format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,  message: "は半角英数字で入力してください。"}

    has_many :items
    has_many :purchases
end
