json.array!(@profile_users) do |profile_user|
  json.extract! profile_user, :id, :first_name, :last_name, :company_name, :industry_domain, :location, :phone_number, :languages_spoken, :skills, :diplomas, :promotion_id
  json.url profile_user_url(profile_user, format: :json)
end
