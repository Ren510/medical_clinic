ActiveAdmin.register Patient do

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
