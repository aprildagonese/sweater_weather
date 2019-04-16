class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :weather, :city, :state, :country
end
