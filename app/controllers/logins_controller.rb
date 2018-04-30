class LoginsController < ApplicationController
  def index
  end

  def auth
    if params[:mail] && params[:image]
      @mail = params[:mail]
      @img = Login.image_capture(params[:image])
      @response = HTTParty.post("http://www.orbticweb.com/rest/verify_user/#{@mail}", body: {image: @img})
      if @response.code == 401
        flash[:alert] = "Petición no procesada #{@response.body}"
        redirect_to root_path
        #send mail
        UserNotifierMailer.fail_login_attempt_notification(@mail).deliver
      else
        UserNotifierMailer.login_successful(@mail).deliver
      end
    else
      flash[:alert] = "Se requiere ingresar toda la información del formulario para procesar su solicitud."
      redirect_to root_path
    end
  end

end
