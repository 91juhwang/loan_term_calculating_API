require 'rails_helper'

RSpec.describe RentRoll, type: :model do
  it { should belong_to(:property) }
end
