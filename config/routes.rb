Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :forecast, only: :index
      resources :backgrounds, only: :index
      resources :road_trip, only: :create
    end
    
    namespace :v2 do
      
      get :signup, to: "users#create"
      get :signin, to: "sessions#create"
      delete :signout, to: "sessions#destroy"
      resources :request
      resources :favorites, except: :update

    end
  end
end
