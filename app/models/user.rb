class User < ApplicationRecord
  has_secure_password
  has_many :quotes

  validates_presence_of :email, :name, :password_digest
end
