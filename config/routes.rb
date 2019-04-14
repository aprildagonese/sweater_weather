Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecasts#show'
      get 'backgrounds', to: 'backgrounds#show'
      post 'users', to: 'users#create'
      post 'sessions', to: 'sessions#create'
      post 'favorites', to: 'user_cities#create'
      get 'favorites', to: 'user_cities#index'
      delete 'favorites', to: 'user_cities#destroy'
    end
  end
end
