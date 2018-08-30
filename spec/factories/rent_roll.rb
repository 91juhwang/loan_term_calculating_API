FactoryBot.define do
  factory :rent_roll do
    monthly_rent { Faker::Number.decimal(2) }
    unit_number '2'
    vacancy true
    bedrooms 3
    bathrooms 3
    property_id nil
  end
end