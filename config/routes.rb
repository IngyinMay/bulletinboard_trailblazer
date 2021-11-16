Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  default_url_options :host => "http://127.0.0.1:3000"
  root 'posts#index'
  get '/login', to: 'login#login'
  post '/login', to: 'login#action_login'
  get '/logout', to: 'login#logout'
  get '/show_password_reset', to: 'login#password_reset'
  post '/sent_password_reset', to: 'login#password_reset_sent'
  get '/reset_password/:token/url', to: 'login#reset_password_form', as: :reset_password
  post '/reset_password/:token/url', to: 'login#reset_password'

  resources :users, only: %i[index show update destroy] do
    collection do
      get :new_user, to: 'users#new'
      post :new_user, to: 'users#create'
      get :profile
      get :edit_profile
      put :edit_profile, to: 'users#update_profile'
      get :edit_password
      put :edit_password, to: 'users#update_password'
    end
    member do
      get :edit
      put :edit, to: 'users#update'
    end
  end

  resources :posts, only: %i[index show update destroy] do
    collection do
      get :new_post, to: 'posts#new'
      post :new_post, to: 'posts#create'
      get :export
      get :csv_format
      get :import
      post :import, to: 'posts#action_import'
      get :filter
      get :search
    end
    member do
      get :edit
      put :edit, to: 'posts#update'
    end
  end
end
