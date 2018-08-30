class Property < ApplicationRecord
  has_many :rent_rolls, dependent: :destroy
  has_many :expenses, dependent: :destroy
end
