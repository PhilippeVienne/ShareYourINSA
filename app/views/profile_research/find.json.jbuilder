json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :avatar
  json.user profile.user, :id, :email
end
