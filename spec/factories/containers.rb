FactoryBot.define do

  factory :container do
    user
    name { Faker::Name.name }
  end

end
