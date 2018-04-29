class LoginsController < ApplicationController
  def index
  end

  def auth
    @email = params[:mail]
    @uploaded_file = Login.image_capture(params[:image])
    @response = HTTParty.post("http://orbticweb.com/rest/verify_user/#{@email}", body: {image: @uploaded_file})
    if @response.code == 401
      flash[:alert] = "Petición no procesada"
      LoginNotificationMailer.login_attempt_notification(@email).deliver
      redirect_to root_path
    end
    #send mail
    LoginNotificationMailer.success_login_notification(@email).deliver
  end
end
