require 'rails_helper'

RSpec.describe Interest, type: :model do
  let!(:user) { create(:user) }
  let!(:ride) { create(:ride, user_id: user.id) }


  it { should belong_to(:user) }

  it { should belong_to(:ride) }

  it "should return indicated interest" do
    create(:interest, user_id: user.id, ride_id: ride.id)
    interest = Interest.indicated(user.id, ride.id)

    expect(interest[0].user_id).to eq(user.id)
    expect(interest[0].ride_id).to eq(ride.id)
  end
end
