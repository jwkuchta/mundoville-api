Rails.application.routes.draw do

  # root to: 'welcome#index'
  # get "/favicon.ico", to: 'welcome#index'

  namespace :api do
    # namespace :v1, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:index]
      resources :exchanges, only: [:create, :index]
      resources :messages, only: [:update, :index]
      resources :reviews, only: [:index, :create]
      resources :friendships, only: [:index, :create]
      post '/users', to: 'users#create'
      get '/users', to: 'users#index'
      get '/users/:sub', to: 'users#show'
      post '/login', to: 'auth#create'
      get '/login', to: 'auth#show'
      get '/profile', to: 'users#profile'
      post '/users/:sub', to: 'users#update'
      post '/findExchanges', to: 'exchanges#findExchanges'
      post '/unfriend', to: 'friendships#unfriend'
      
    end
  end
end



