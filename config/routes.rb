Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :login] do
        get '/create', to: 'users#create'
        post '/login', to: 'users#login'
        get '/doctors', to: 'doctors#index'
      end
      resources :appointments, only: [:index, :create, :show, :update, :destroy] do
        resources :doctors, only: [:index, :create, :show, :update, :destroy]
        get '/show_appointments', to: 'appointments#show'
        get '/show_doctors', to: 'doctors#show'
      end
    end
  end
end
