require 'rails_helper'

RSpec.describe Interest, type: :model do
  it { should belong_to(:user) }

  it { should belong_to(:ride) }
end
