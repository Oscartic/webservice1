class LoginNotificationMailer < ApplicationMailer
  default from: 'notify@orbticapp.com'
  def login_attempt_notification(email)
    @mail = email
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {
        :from    => ENV['email'],
        :to      => @mail,
        :subject => 'Autenticación fallida',
        :text    => 'Se ha intentado ingresar a la plataforma ORBTICAPP y el resultado ha sido fallido.'
    }
    mg_client.send_message ENV['domain'], message_params
  end

  def success_login_notification(email)
  @mail = email
  mg_client = Mailgun::Client.new ENV['api_key']
  message_params = {
      :from    => ENV['email'],
      :to      => @mail,
      :subject => 'Autenticación exitosa',
      :text    => 'Se ha ingresado a la plataforma ORBTICAPP de forma exitosa.'
  }
  mg_client.send_message ENV['domain'], message_params
  end

end
