Rails.application.routes.draw do
  namespace :api , defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :create, :login, :show] do
        # get '/doctors', to: 'doctors#index'
        resources :doctors, only: [:index, :create, :show, :update, :destroy] do
          resources :appointments , only: [:index, :create, :destroy]
        end
      end
    end
  end
end
