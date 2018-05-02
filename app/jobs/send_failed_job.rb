class SendFailedJob < ApplicationJob
  queue_as :default

  def perform(mail)
    @mail = mail
    UserNotifierMailer.fail_login_attempt_notification(@mail).deliver_later
  end
end
