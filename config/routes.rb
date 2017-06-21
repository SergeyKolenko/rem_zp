Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: 'user/registrations'}

  root 'proposals#index'

  post '/users/sign_up',  to: 'user/registrations#create'
end
