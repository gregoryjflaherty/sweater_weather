Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :forecast, only: :index
      resources :backgrounds, only: :index
      resources :users, only: :create
      resources :road_trip, only: :create
    end
    
    namespace :v2 do
      post :log_in, to: "sessions#create"
      post :log_out, to: "sessions#destroy"
      resources :request
      resources :favorites, except: :update

    end
  end
end
