class Property < ApplicationRecord
  has_many :units, dependent: :destroy
  has_many :expenses, dependent: :destroy
end
