FactoryBot.define do
  factory :expense do
    marketing { Faker::Number.decimal(2) }
    taxes { Faker::Number.decimal(2) }
    insurance { Faker::Number.decimal(2) }
    repairs { Faker::Number.decimal(2) }
    administration { Faker::Number.decimal(2) }
    payroll { Faker::Number.decimal(2) }
    utility { Faker::Number.decimal(2) }
    management { Faker::Number.decimal(2) }
    property_id nil
  end
end