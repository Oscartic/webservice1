class LoginNotificationMailer < ApplicationMailer
  default from: 'notify@orbticapp.com'
  def fail_login_attempt_notification(email)
    @mail = email
    mail( :to => @mail,
          :subject => 'Se ha producido un intento fallido de inicio de sesión.' )
  end

end
