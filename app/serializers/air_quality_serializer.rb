class AirQualitySerializer
  include JSONAPI::Serializer
  attributes :id, :city, :aqi, :pm25_concentration, :co_concentration
end
