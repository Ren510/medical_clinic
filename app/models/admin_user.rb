class AdminUser < ApplicationRecord
  # permit_params :name, :admin

  # 管理者側の画像を追加
  attachment :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
