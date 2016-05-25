json.array!(@profiles) do |profile|
  json.id profile.user.id
  json.name profile.name
  json.avatar profile.avatar
end
