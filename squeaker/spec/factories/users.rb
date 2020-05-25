FactoryBot.define do
  factory :user do
    username { Faker::Movies::StarWars.character }
    password { 'starwars' }
    birth_year { 1995 }
    association :location, factory: :location 
    # first :location refers to assocation, second :location refers to location factory
  end
end