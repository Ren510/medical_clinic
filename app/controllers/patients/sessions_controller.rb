# frozen_string_literal: true
class Patients::SessionsController < Devise::SessionsController
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def reject_inactive_patient
  #   @patient = Patient.find_by(email: params[:patient][:email])
  #   if @patient
  #     if @patient.valid_password?(params[:patient][:password]) && !@patient.is_active
  #       flash[:danger] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
  #       redirect_to new_patient_session_path
  #     end
  #   end
  # end
end
