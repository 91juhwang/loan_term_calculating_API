FactoryBot.define do
  factory :quote do
    loan_amount 50.00
    debt_rate { Faker::Number.decimal(2) }
  end
end