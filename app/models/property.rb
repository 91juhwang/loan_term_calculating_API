class Property < ApplicationRecord
  belongs_to :address
  has_many :units, dependent: :destroy
  has_many :expenses, dependent: :destroy
end
