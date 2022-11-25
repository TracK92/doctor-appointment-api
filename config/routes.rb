Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :login] do
        resources :appointments, only: [:index, :create, :show, :update, :destroy]
      end
      get '/users/:id/doctors', to: 'doctors#show_user_doctors'   
      get '/appointments', to: 'appointments#index'
      get '/appointments/:id', to: 'appointments#show'

      get '/doctors', to: 'doctors#index'   
      get '/doctors/:id', to: 'doctors#show'
      put '/doctors/:id', to: 'doctors#update'
      delete '/doctors/:id', to: 'doctors#destroy'
      post '/doctors/', to: 'doctors#create'
    end
  end
end
