require 'rails_helper'

RSpec.describe Ride, type: :model do
  it { should validate_presence_of(:destination) }

  it { should validate_presence_of(:origin) }

  it { should validate_presence_of(:take_off) }

  it { should validate_presence_of(:seats_available) }

  it { should have_many(:interests) }

  it { should have_many(:users).through(:interests) }
end
