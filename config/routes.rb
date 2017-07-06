Rails.application.routes.draw do

  devise_for :user, controllers: {devise: 'user/registrations'}

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

    resources :users, except: [:show]

    devise_scope :user do
      get 'user/edit',  to: 'user/registrations#edit', as: :edit_user_registration
    end

    scope :user do
      controller 'user/helpers' do
        get '/:id/sent_confirmation', action: :sent_confirmation_instruction, as: :sent_user_confirmation
        get '/:id/reset_password', action: :reset_password, as: :reset_user_password
        get '/:id/block', action: :block_user, as: :block_user
        get '/:id/unblock', action: :unblock_user, as: :unblock_user
      end
    end

    resources :categories, except: [:show, :new, :edit]
    resources :types, except: [:show, :new, :edit]
    resources :options, except: [:show, :new, :edit]
    resources :districts, except: [:show, :new, :edit]

    resources :regions, except: [:show, :new, :edit] do
      collection { post :import }
    end

    resources :cities, except: [:show, :new, :edit] do
      collection { post :import }
    end
    get '/cities_for_region/:id', action: :cities_for_region, as: 'cities_for_region'

    resources :districts, only: [:index, :create, :update, :destroy] do
      collection { post :import }
    end

    controller :helpers do
      get '/upload_instructions', action: :upload_instructions
    end
  end
end



