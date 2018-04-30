class UserNotifierMailer < ApplicationMailer
  default from: 'notify@orbticapp.com'

  def fail_login_attempt_notification(mail)
      @email = mail
      mail( :to => @email,
            :subject => 'Pongase en contacto con el administrador del sistema.' )
  end

  def login_successful(mail)
    @email = mail
    mail( :to => @email,
          :subject => 'Pongase en contacto con el administrador del sistema.' )
  end
end
