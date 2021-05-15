class NotificationMailer < ApplicationMailer
  default from: "hogehoge@example.com"

  def send_confirm_to_patient(patient)
    @patient = patient
    mail(
      subject: "会員登録が完了しました。", #メールのタイトル
      to: @patient.email, #宛先
    )
  end
end
