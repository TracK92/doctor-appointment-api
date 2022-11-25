Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :login] do
        post '/create', to: 'users#create'
        get '/login', to: 'users#login'
        get '/doctors', to: 'doctors#index'
        post '/appointments', to: 'appointments#create'
        get '/appointments', to: 'appointments#index'
        
      end
      resources :doctors, only: [:index, :create, :show, :update, :destroy] do
        get '/appointments', to: 'appointments#index'
        resources :appointments, only: [:index, :create, :show, :update, :destroy]
        get '/show_appointments', to: 'appointments#show'
        get '/show_doctors', to: 'doctors#show'
      end
    end
  end
end
