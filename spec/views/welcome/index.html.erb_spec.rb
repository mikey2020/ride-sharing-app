require 'rails_helper'

RSpec.describe "welcome/index.html.erb" do
  before do
    render
  end

  it "renders the welcome page" do
    expect(rendered).to include('Welcome to Ride Share')
    expect(rendered).to include('Collaborate and Carpool to work or home')
  end
end
