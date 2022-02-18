class User < ApplicationRecord
  has_one_attached :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # bookモデルとのアソシエーション(関連づけ):「usersテーブル:booksテーブル=1:N」
  has_many :books, dependent: :destroy
  
  # バリデーションの設定
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }

end
