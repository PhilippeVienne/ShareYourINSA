# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.find_or_create_by(email: 'admin@example.com') do |u|
  u.password = 'password'
  u.password_confirmation = 'password'
end

['Lyon', 'Toulouse', 'Rennes', 'Rouan', 'Strasbourg', 'Centre Val de Loire'].each do |insa|
  Insa.find_or_create_by name: "INSA #{insa}", location: insa
end

insa_lyon = Insa.find_or_create_by name: 'INSA Lyon', location: 'Lyon'

[
    'Bio-sciences',
    'Bio-Informatique Modélisation',
    'Génie Energétique Environnement',
    'Génie Electrique',
    'Génie Civile Urbanisme',
    'Génie Mécanique Conception',
    'Génie Mécanique Développement',
    'Génie Mécanique Procédés Plasturgie',
    'Génie Industriel',
    'Génie Informatique',
    'Science et Génie des Matériaux',
    'Télécommunication, Services et Usages'
].each do |dep_name|
  dep = Department.find_or_create_by department_name: dep_name, insa: insa_lyon
  (1962..2016).each do |year|
    Promotion.create year: year, number: (1961 - year), department: dep
  end
end

