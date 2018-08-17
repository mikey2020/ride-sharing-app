require 'rails_helper'

RSpec.describe UserArea, type: :model do
  it { should belong_to(:user) }

  it { should belong_to(:area) }
end
