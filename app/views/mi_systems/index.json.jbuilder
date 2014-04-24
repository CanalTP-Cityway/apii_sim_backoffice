json.array!(@mi_systems) do |mi_system|
  json.extract! mi_system, :id, :name, :comment, :api_url, :api_key, :start_date, :end_date, :multiple_starts_and_arrivals
  json.url mi_system_url(mi_system, format: :json)
end
