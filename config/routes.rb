Rails.application.routes.draw do
  root to: 'logins#index'
  #get 'login', to: 'logins#auth'
  post 'login', to: 'logins#auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end