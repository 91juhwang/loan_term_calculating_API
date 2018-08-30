FactoryBot.define do
  factory :property do
    address { Faker::Address.street_address }
  end
end