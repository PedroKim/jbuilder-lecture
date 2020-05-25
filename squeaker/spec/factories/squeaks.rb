FactoryBot.define do
  factory :squeak do
    body { Faker::Movies::StarWars.quote }
    association :author, factory: :user
    # uses the user factory to create an author association
  end
end