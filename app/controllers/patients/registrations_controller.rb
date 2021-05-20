class Patients::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  #   mypage_path
  # end

  def create
    super
    # NotificationMailer.send_confirm_to_patient(resource).deliver_no
    WelcomeMailer.welcome(resource).deliver_now
    # @patient = patient
  end
  end
