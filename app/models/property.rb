class Property < ApplicationRecord
  belongs_to :address
  has_many :units, dependent: :destroy
end
