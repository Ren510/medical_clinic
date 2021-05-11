class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :gender,
      :birthday,
      :email,
      :postal_code,
      :prefecture_name,
      :address_city,
      :address_street,
      :address_building,
      :disease,
      :telephone_number
  ])
  end
end
