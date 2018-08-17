require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }

  it { should validate_uniqueness_of(:username) }

  it do
    should allow_value('test@gmail.com').
      for(:email).
      with_message('must be valid')
  end

  it do
    should validate_length_of(:password).
      is_at_least(6).
      on(:create)
  end

  it do
    should allow_value('test1234').
      for(:password).
      on(:create)
  end

  it { should have_many(:rides) }

  it { should have_many(:interests) }

  it { should have_many(:rides).through(:interests) }
end
