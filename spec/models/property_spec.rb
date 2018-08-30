require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should belong_to(:address) }
  it { should have_many(:units).dependent(:destroy) }
  it { should have_many(:expenses).dependent(:destroy) }
end
