class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource_name == :patient
      mypage_path
    elsif resource_name == :admin_user
      admin_dashboard_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource_name == :patient
      root_path
    elsif resource_name == :admin_user
      root_path
      end
  end

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
      :prefecture_code,
      :address_city,
      :address_street,
      :address_building,
      :disease,
      :telephone_number,
    ])
  end
end
