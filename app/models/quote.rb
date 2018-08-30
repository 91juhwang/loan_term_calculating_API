class Quote < ApplicationRecord
  validates_presence_of :created_by
end
