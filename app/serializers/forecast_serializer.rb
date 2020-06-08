class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :city,
             :state,
             :country,
             :time,
             :timezone_offset,
             :timezone,
             :current,
             :current_high,
             :current_low,
             :summary,
             :icon,
             :feels_like,
             :humidity,
             :visibility,
             :uv_index,
             :uv_category,
             :sunrise,
             :sunset,
             :daily_forecasts,
             :hourly_forecasts
             
end
