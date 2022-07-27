Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :user, skip: [:passwords]

  namespace :api do  
    namespace :v1 do
      resources :forecast, only: :index
      resources :backgrounds, only: :index
      resources :road_trip, only: :create
    end
    
    namespace :v2 do
      # get :signup, to: "users#create"
      # get :signin, to: "sessions#create"
      # delete :signout, to: "sessions#destroy"
      resources :my_trips, only: [:index, :create]
      resources :requests, except: [:destroy, :new]
    end
  end
end
