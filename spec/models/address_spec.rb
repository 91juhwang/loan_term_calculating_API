require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to(:city) }
  it { should have_one(:property).dependent(:destroy) }
end
