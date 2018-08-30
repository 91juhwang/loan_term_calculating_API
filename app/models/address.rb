class Address < ApplicationRecord
  belongs_to :city
  has_one :property, dependent: :destroy
end
