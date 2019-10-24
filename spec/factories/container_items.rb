FactoryBot.define do

  factory :container_item do
    container
    name { Faker::Name.name }
  end

end
