Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecasts#show', as: :forecast
      get 'backgrounds', to: 'backgrounds#show', as: :background
    end
  end
end
