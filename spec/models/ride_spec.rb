require 'rails_helper'

RSpec.describe Ride, type: :model do
  let(:user) { create(:user) }

  let(:ride) { create(:ride, ride_type: 0, seats_available: 3, user_id: user.id) }

  let(:ride_req) { create(:ride, ride_type: 1, seats_available: 3, user_id: user.id) }

  it { should validate_presence_of(:destination) }

  it { should validate_presence_of(:origin) }

  it { should validate_presence_of(:take_off) }

  it { should validate_presence_of(:seats_available) }

  it { should have_many(:interests) }

  it { should have_many(:users).through(:interests) }

  it "returns seats available for ride offer" do
    expect(ride.display_ride_type).to eq('3 seats available')
  end

  it "returns seats wanted for ride type" do
    expect(ride_req.display_ride_type).to eq('3 seats wanted')
  end
end
