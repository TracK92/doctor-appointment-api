Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :login] do
        resources :appointments, only: [:index, :create, :show, :update, :destroy]
        resources :doctors, only: [:create, :destroy]
      end
      post 'users/login', to: 'users#login'
      get '/users/:id/doctors', to: 'doctors#show_user_doctors'   
      get '/appointments', to: 'appointments#show_all'
      get '/appointments/:id', to: 'appointments#show'

      get '/doctors', to: 'doctors#index'   
      get '/doctors/:id', to: 'doctors#show'
      put '/doctors/:id', to: 'doctors#update'
    end
  end
end
