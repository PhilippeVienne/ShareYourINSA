json.array!(@departments) do |department|
  json.extract! department, :id, :department_name, :id_insa, :creation_date
  json.url department_url(department, format: :json)
end
