class WelcomeMailer < ApplicationMailer
  # 新規登録後のthnksメール
  def welcome (patient)
    @patient = patient
    mail(subject: 'welcome', to: patient.email)
  end

  # 予約後のthanksメール
  def confirm (reservation)
    @reservation = reservation
    mail(subject: 'confirm', to: reservation.patient.email)
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name)
  end

end
