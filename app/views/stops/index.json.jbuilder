json.array!(@stops) do |stop|
  json.extract! stop, :id, :stop_code, :mi_system_id, :name, :type, :administrative_code, :site_ref, :transport_mode, :quay_type, :lat, :lon, :shape
  json.url stop_url(stop, format: :json)
end
