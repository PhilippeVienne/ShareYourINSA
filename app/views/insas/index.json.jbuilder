json.array!(@insas) do |insa|
  json.extract! insa, :id, :name, :location
  json.url insa_url(insa, format: :json)
end
