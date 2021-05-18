# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :admin

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in

  def create
  　@admin = admin.new(admin_params)
   if @admin.save
     redirect_to admin_root_path, notice:”ユーザー「#{@user.name}」を登録しました”
   else
     render :new
   end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def admin_params
   params.require(:admin).permit(:email, :password)
  end
  
end
