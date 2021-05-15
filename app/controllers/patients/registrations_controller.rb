  class Patients::RegistrationsController < Devise::RegistrationsController
    # def after_sign_up_path_for(resource)
    #   mypage_path
    # end
    
    def create
      super
      # NotificationMailer.send_confirm_to_patient(resource).deliver_now
      WelcomeMailer.welcome(resource).deliver_now
    end
  end
