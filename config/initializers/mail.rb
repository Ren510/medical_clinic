if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com',
    domain: 'gmail.com',
    port: 587,
    # 環境変数で隠す.env
    user_name: ENV['production_Mail_user_name'],
    password: ENV['production_Mail_user_password'],
    authentication: 'plain',
    enable_starttls_auto: true
  }
elsif Rails.env.development?
  #ActionMailer::Base.delivery_method = :letter_opener
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com',
    domain: 'gmail.com',
    port: 587,
    # 環境変数で隠す.env
    user_name: ENV['development_Mail_user_name'],
    password: ENV['development_Mail_user_password'],
    authentication: 'plain',
    enable_starttls_auto: true
  }
else
  ActionMailer::Base.delivery_method = :test
end