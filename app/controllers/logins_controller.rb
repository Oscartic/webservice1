class LoginsController < ApplicationController
  def index
  end

  def auth
    if params[:mail] && params[:image]
      @mail = params[:mail]
      @img = Login.image_capture(params[:image])
      @response = HTTParty.post("http://www.orbticweb.com/rest/verify_user/#{@mail}", body: {image: @img})
      if @response.code == 200
        SendSuccessJob.set(wait: 20.seconds).perform_later(@mail)
      else
        flash[:alert] = "Credenciales de usuario incorrectas. #{@response.body}"
        SendFailedJob.set(wait: 20.seconds).perform_later(@mail)
        redirect_to root_path
      end
    else
      flash[:alert] = "Se requiere ingresar toda la información del formulario para procesar su solicitud."
      redirect_to root_path
    end
  end

end
