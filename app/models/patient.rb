class Patient < ApplicationRecord
   # ユーザーのデバイス
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザの性別enum(男: 0,女: 1)
  enum gender: { man: 0, woman: 1}

  # ユーザの新規登録で、郵便番号入力した際に住所自動入力するための記述
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
