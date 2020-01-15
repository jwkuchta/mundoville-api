Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update, :destroy, :show]
      post '/users', to: 'users#index'
      get '/users', to: 'users#index'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
