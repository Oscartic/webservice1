class LoginNotificationMailer < ApplicationMailer
  default from: 'notify@orbticapp.com'
  def login_attempt_notification(email)
    @mail = email
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {
        :from    => ENV['email'],
        :to      => @mail,
        :subject => 'Sample Mail using Mailgun API',
        :text    => 'This mail is sent using Mailgun API via mailgun-ruby'
    }
    mg_client.send_message ENV['domain'], message_params
  end

end
