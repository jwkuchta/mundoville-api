Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update, :destroy, :show]
      post '/users', to: 'users#index'
      get '/users', to: 'users#index'
      post '/login', to: 'auth#create'
      get '/login', to: 'auth#show'
      get '/profile', to: 'users#profile'
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