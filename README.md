# README

Webservice1

Para poder correr el proyecto en un ambiente de desarrollo se requiere: 

bundle install
rails db:create (Antes debe configurar su archivo config/database.yml)
rails db:migrate
rails s

En el root del proyecto, queda configurado el form donde se realiza la petición al webservice2. 


El envío de correo de notificación exitosa/fallada se realiza con el servicio Sendgrid y se ejecuta mediante un job programado cada 20 segundo por lo que deberá configurar las variables de entorno con sus credenciales de Sendgrid y correr un bundle exec rake jobs:work antes de poder verificar el envío de mails. 

