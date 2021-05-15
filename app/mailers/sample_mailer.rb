class SampleMailer < ApplicationMailer
  def welcome
    mail(subject: 'welcom', to: 'sample@sample.com')
  end
end
