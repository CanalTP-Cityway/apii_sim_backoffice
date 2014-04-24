json.array!(@modes) do |mode|
  json.extract! mode, :id, :mode_code, :mode_description
  json.url mode_url(mode, format: :json)
end
