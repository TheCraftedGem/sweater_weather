Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
        get '/forecast', to: 'forecast#show'
        post "/users", to: "users#create"
        get '/gifs', to: 'giphy#show'
        post '/sessions', to: 'sessions#create'
        resource :favorites, only: [:show, :create, :destroy]
    end
  end
end
