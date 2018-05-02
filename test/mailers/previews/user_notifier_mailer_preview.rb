# Preview all emails at http://localhost:3000/rails/mailers/user_notifier_mailer
class UserNotifierMailerPreview < ActionMailer::Preview
  def fail_login_attempt_notification
    UserNotifierMailer.fail_login_attempt_notification 'oscartic@gmail.com' #Login.new(mail: 'oscartic@gmail.com', image: 'start image')
  end

  def login_successful
    UserNotifierMailer.login_successful 'oscartic@gmail.com'
  end
end
