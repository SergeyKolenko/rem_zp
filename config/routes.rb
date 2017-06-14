Rails.application.routes.draw do
  devise_for :users

  root 'proposals#index'
end
