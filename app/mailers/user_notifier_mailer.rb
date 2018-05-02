class UserNotifierMailer < ApplicationMailer
  default from: 'notify@orbticapp.com'

  def fail_login_attempt_notification(mail)
      @mail = mail
      mail( :to => @mail,
            :subject => 'Inicio de sesión fallido.' )
  end

  def login_successful(mail)
    @mail = mail
    mail( :to => @mail,
          :subject => 'Inicio de sesión exitoso.' )
  end
end
