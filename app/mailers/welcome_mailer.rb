class WelcomeMailer < ApplicationMailer
  def welcome (patient)
    @patient = patient
    mail(subject: 'welcome', to: patient.email)
  end


  def confirm (reservation)
    @patient = patient
    mail(subject: 'confirm', to: reservation.patient.email)
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name)
  end

end
