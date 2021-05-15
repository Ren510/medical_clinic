class WelcomeMailer < ApplicationMailer
  def welcome (patient)
    
    mail(subject: 'welcome', to: patient.email)
  end
  
  def confirm (reservation)
    
    mail(subject: 'confirm', to: reservation.patient.email)
  end
end
