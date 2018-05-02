class SendSuccessJob < ApplicationJob
  queue_as :default

  def perform(mail)
    @mail = mail
    UserNotifierMailer.login_successful(@mail).deliver_later
  end
end
