require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should have_many(:rent_rolls).dependent(:destroy) }
  it { should have_many(:expenses).dependent(:destroy) }
end
