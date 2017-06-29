Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: 'user/registrations'}

  root 'proposals#index'

  devise_scope :user do
    post '/users/sign_up',  to: 'user/registrations#create'
    get '/users/sign_up_with_role/:id', to: 'user/registrations#new_with_role', as: :users_sign_up_with_role
  end

  # ADMIN PANEL
  namespace :admin do

    controller :dashboards do
      get '/', action: :dashboard, as: :dashboard
    end

    resources :regions, only: [:index, :create, :update, :destroy] do
      collection { post :import }
    end

    controller :helpers do
      get '/upload_instructions', action: :upload_instructions
    end
  end
end
