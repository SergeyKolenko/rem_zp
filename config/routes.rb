Rails.application.routes.draw do

  devise_for :user, controllers: {devise: 'user/registrations'}

  root 'proposals#index'

  devise_scope :user do
    post '/users/sign_up',  to: 'user/registrations#create'
    get '/users/sign_up_with_role/:id', to: 'user/registrations#new_with_role', as: :users_sign_up_with_role
  end

  # ADMIN PANEL
  namespace :admin do

    devise_scope :user do
      get 'user/edit',  to: 'user/registrations#edit', as: :edit_user_registration
    end

    controller :dashboards do
      get '/', action: :dashboard, as: :dashboard
    end

    resources :users, except: [:show]
    get 'sent_confirmation/:id', to: 'user/helpers#sent_confirmation_instruction', as: :sent_confirmation
    get 'reset_password/:id', to: 'user/helpers#reset_password', as: :reset_password
    get 'block/:id', to: 'user/helpers#block_user', as: :block
    get 'unblock/:id', to: 'user/helpers#unblock_user', as: :unblock

    resources :categories, except: [:show, :new, :edit]
    resources :types, except: [:show, :new, :edit]
    resources :options, except: [:show, :new, :edit]
    resources :users, except: [:show, :new, :edit]
    resources :cities, except: [:show, :new, :edit]
    resources :districts, except: [:show, :new, :edit]
    resources :regions, except: [:show, :new, :edit] do
      collection { post :import }
    end

    resources :cities, except: [:show, :new, :edit] do
      collection { post :import }
    end

    resources :districts, only: [:index, :create, :update, :destroy] do
      collection { post :import }
    end

    controller :helpers do
      get '/upload_instructions', action: :upload_instructions
    end
  end
end



