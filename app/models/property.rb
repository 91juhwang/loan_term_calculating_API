class Property < ApplicationRecord
  has_many :rentrolls, dependent: :destroy
  has_many :expenses, dependent: :destroy
end
