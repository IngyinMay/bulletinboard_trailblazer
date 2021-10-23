Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'login#login'
  get '/login', to: 'login#login'
  post '/login', to: 'login#action_login'
  get '/logout', to: 'login#logout'

  resources :users, only: [:index, :show, :update, :destroy] do
    collection do
      get :new_user, to:"users#new"
      post :new_user, to:"users#create"
      get :profile
      get :edit_profile
      put :edit_profile, to: "users#update_profile"
      get :edit_password
      put :edit_password, to: "users#update_password"
    end
    member do
      get :edit
      put :edit, to: 'users#update'
    end
  end
  
  resources :posts, only: [:index, :show, :update, :destroy] do
    collection do
      get :new_post, to:"posts#new"
      post :new_post, to: "posts#create"
    end
    member do
      get :edit
      put :edit, to: 'posts#update'
    end
  end
end
