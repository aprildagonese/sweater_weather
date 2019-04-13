Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecasts#show', as: :forecast
      get 'backgrounds', to: 'backgrounds#show', as: :background
      post 'users', to: 'users#create', as: :create_user
      get "/404" => "errors#not_found"
      get "/500" => "errors#exception"
    end
  end
end
