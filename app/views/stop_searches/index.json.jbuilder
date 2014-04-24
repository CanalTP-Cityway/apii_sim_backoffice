json.array!(@stop_searches) do |stop_search|
  json.extract! stop_search, :id, :stop_name, :postal_code, :administrative_code, :stop_code, :stop_id, :neighbour_stop_id, :mis_id, :has_transition
  json.url stop_search_url(stop_search, format: :json)
end
