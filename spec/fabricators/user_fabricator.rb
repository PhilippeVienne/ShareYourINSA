
Fabricator(:user) do
  profile_user
  email {Faker::Internet.email}
  password 'password'
  password_confirmation 'password'
end

Fabricator(:profile_user) do
  first_name {Faker::Name.first_name}
  last_name {Faker::Name.last_name}
  company_name {Faker::Company.name}
  industry_domain {Faker::Company.industry}
  promotion {Promotion.order('RANDOM()').limit(1).first}
end

Fabricator(:post) do
  user {User.order('RANDOM()').limit(1).first}
  content {Faker::Lorem.paragraph 10}
end

Fabricator(:comment) do
  user {User.order('RANDOM()').limit(1).first}
  post {Post.order('RANDOM()').limit(1).first}
  content {Faker::Lorem.paragraph 1}
end