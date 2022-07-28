Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :user, skip: [:passwords]

  namespace :api do  
    namespace :v1 do
      resources :forecast, only: :index
      resources :backgrounds, only: :index
      resources :road_trip, only: :create

    
    namespace :v2 do
      resources :my_trips, only: [:index, :create]
      resources :invitations, except: [:destroy, :new]
    end
  end
end
