json.array!(@connections) do |connection|
  json.extract! connection, :id, :stop_1_id_id, :stop_2_id_id, :distance, :duration, :prm_duration, :shape
  json.url connection_url(connection, format: :json)
end
