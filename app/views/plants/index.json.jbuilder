json.array!(@plants) do |plant|
  json.extract! plant, :id, :common_name, :scientific_name, :max_temp, :min_temp, :description, :url_image
  json.url plant_url(plant, format: :json)
end
