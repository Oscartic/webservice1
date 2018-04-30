class LoginsController < ApplicationController
  def index
  end

  def auth
    if params[:mail] && params[:image]
      email = params[:mail]
      uploaded_file = Login.image_capture(params[:image])
      @response = HTTParty.post("http://www.orbticweb.com/rest/verify_user/#{email}", body: {image: uploaded_file})
      if @response.code == 401
        flash[:alert] = "Petición no procesada #{@response.body}"
        redirect_to root_path
      end
      #send mail
      UserNotifierMailer.fail_login_attempt_notification(@email).deliver
    else
      flash[:alert] = "Se requiere ingresar toda la información del formulario para procesar su solicitud."
      redirect_to root_path
    end
  end

end
