class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :email,              format: { with: /@.+/,                                  message: "は@を含めて入力してください。"}
    validates :first_name,         format: { with: /\A[ぁ-んァ-ン一-龥]/,                    message: "は全角で入力してください。"}
    validates :last_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/,                    message: "は全角で入力してください。"}
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/,                       message: "は全角カタカナで入力して下さい。"}
    validates :last_name_reading,  format: { with: /\A[ァ-ヶー－]+\z/,                       message: "は全角カタカナで入力して下さい。"}
    validates :password,           format: { with: /greater_than_or_equal_to: 6/,           message: "は6文字以上で入力してください。"}
    validates :password,           format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,  message: "は半角英数字で入力してください。"}
  end

end
