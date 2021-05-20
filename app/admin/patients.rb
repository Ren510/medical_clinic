ActiveAdmin.register Patient do
  permit_params :first_name,
                :last_name,
                :first_name_kana,
                :last_name_kana,
                :gender,
                :birthday,
                :email,
                :postal_code,
                :prefecture_code,
                :address_city,
                :address_street,
                :address_building,
                :disease,
                :telephone_number,
                :password,
                :password_confirmation

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :first_name_kana
      f.input :last_name_kana
      f.input :gender
      f.input :birthday
      f.input :email
      f.input :postal_code
      f.input :prefecture_code
      f.input :prefecture_name
      f.input :address_city
      f.input :address_street
      f.input :address_building
      f.input :disease
      f.input :telephone_number
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :telephone_number, :disease, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :birthday, :gender
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :telephone_number, :disease, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :birthday, :gender]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
