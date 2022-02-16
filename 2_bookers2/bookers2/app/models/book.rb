class Book < ApplicationRecord

  # userモデルとのアソシエーション(関連づけ):「usersテーブル:booksテーブル=1:N」
  # (注意)bookモデルに関連づけられるのは１つのuserモデルのため、単数形の「user」になる
  belongs_to :user

  # バリデーションの設定
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 1, maximum: 200 }

end
