require 'rails_helper' 

RSpec.describe RidesController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      sign_in

      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end

  describe "GET new" do
    it "renders the new template" do
      sign_in

      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template('new')
    end
  end

  describe "EDIT new" do
    let(:user) { create(:user) }
    let(:ride) { create(:ride, user_id: user.id) }

    it "renders the edit template" do
      sign_in

      get :edit, params: { id: ride.id }
      expect(response.status).to eq(200)
      expect(response).to render_template('edit')
    end
  end

  describe "POST create" do
    let!(:user) { create(:user) }
    let!(:ride) { build(:ride, user_id: user.id) }

    it "responds to html by default" do
      post :create
      expect(response.content_type).to eq "text/html"
    end

    it "redirects to index page" do
      sign_in(user)

      post :create, :params => { :ride => {
        destination: 'ikeja',
        origin: 'akoka',
        seats_available: 5,
        take_off: '2018-08-20 16:18:54.604809',
        ride_type: 'offer'
      } }
      
      expect(response.content_type).to eq "text/html"
      expect(response.status).to eq(302)
      expect(response).to be_redirect
    end

    it "should fail with invalid params" do
      sign_in

      post :create, :params => { :ride => { origin: ''}, }
      expect(response.content_type).to eq "text/html"
      expect(response.status).to eq(400)
    end
  end

  describe "PUT update" do
    let!(:user) { create(:user) }
    let!(:ride) { create(:ride, user_id: user.id) }

    it "responds to html by default" do
      put :update, params: { id: 1 }
      expect(response.content_type).to eq "text/html"
    end

    it "updates ride's origin" do
      sign_in

      put :update, params: {
        id: ride.id, ride: {
          origin: 'Maryland',
        },
      }
      expect(response.content_type).to eq "text/html"
      expect(response.status).to eq(302)
      expect(response).to be_redirect
    end
  end

  describe "PUT book ride" do
    let!(:user) { create(:user) }
    let!(:ride) { create(:ride, user_id: user.id) }

    it "responds to html by default" do
      put :book_ride, params: { id: 1 }
      expect(response.content_type).to eq "text/html"
    end

    it "updates ride's seats available" do
      sign_in

      user_mailer(user)

      put :book_ride, params: { id: ride.id }
      
      expect(response.status).to eq(302)
      expect(response).to be_redirect
    end
  end

  describe "DELETE destroy" do
    let!(:user) { create(:user) }
    let!(:ride) { create(:ride, user_id: user.id) }

    it "deletes ride from the database" do
      sign_in

      delete :destroy, params: { id: ride.id }

      expect(response.status).to eq(302)
      expect(response).to be_redirect
    end
  end
end
