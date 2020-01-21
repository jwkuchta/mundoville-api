Rails.application.routes.draw do
  namespace :api do
    # namespace :v1, defaults: {format: :json} do
    namespace :v1 do
      resources :users
      resources :exchanges, only: [:create, :index]
      resources :messages, only: [:update, :index]
      post '/users', to: 'users#index'
      get '/users', to: 'users#index'
      get '/users/:id', to: 'users#show'
      post '/login', to: 'auth#create'
      get '/login', to: 'auth#show'
      get '/profile', to: 'users#profile'
      patch '/upload', to: 'users#upload'
      post '/findExchanges', to: 'exchanges#findExchanges'
      
    end
  end
end

# post '/login', to: 'auth#create'
# get '/profile', to: 'users#profile'
# post '/find', to: 'follows#removeFollow'
# post '/remove', to: 'close_friends#remove'
# post '/getConvos', to: 'conversations#getConvos'
# post '/upload', to: 'photos#upload'
# post '/photos', to: 'photos#allphotos'
# post '/featured', to: 'photos#featured'

