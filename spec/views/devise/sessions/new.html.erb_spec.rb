require 'rails_helper'
require 'pry'

RSpec.describe "devise/sessions/new.html.erb" do
  before do
    render
  end

  it "renders the form to log in" do
    expect(rendered).to include("Log in")
    expect(rendered).to include("Email")
    expect(rendered).to include("Password")
    expect(rendered).to include("Remember me")
    expect(rendered).to include("Forgot your password?")
  end
end
