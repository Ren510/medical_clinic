class Patient < ApplicationRecord
  has_many :reservations, dependent: :destroy

  # ユーザの性別enum(男: 0,女: 1)
  enum gender: { man: 0, woman: 1}

  # ユーザの検索で使用する
  # belongs_to :prefecture

  # scope :search, -> (search_params) do
  #   return if search_params.blank?

  #   name_like(search_params[:name])
  #     .gender_is(search_params[:gender])
  #     .birthday_from(search_params[:birthday_from])
  #     .birthday_to(search_params[:birthday_to])
  #     .prefecture_id_is(search_params[:prefecture_id])
  # end
  # scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  # scope :gender_is, -> (gender) { where(gender: gender) if gender.present? }
  # scope :birthday_from, -> (from) { where('? <= birthday', from) if from.present? }
  # scope :birthday_to, -> (to) { where('birthday <= ?', to) if to.present? }
  # scope :prefecture_id_is, -> (prefecture_id) { where(prefecture_id: prefecture_id) if prefecture_id.present? }

   # ユーザーのデバイス
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  # validates :last_name, presence: true
  # validates :first_name, presence: true
  # validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  # validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  # validates :email, presence: true, uniqueness: true
  # validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  # validates :address_city, presence: true
  # validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }

  # def full_name
  #   first_name + " " + last_name
  # end

  # def full_name_kana
  #   first_name_kana + " " + last_name_kana
  # end

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