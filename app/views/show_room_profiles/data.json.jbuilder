json.array!(@profiles) do |profile|
  json.profile profile.profile_user, :id, :first_name, :last_name, :avatar
  json.content profile.description
  json.video profile.video_resource
end
