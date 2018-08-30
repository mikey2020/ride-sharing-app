require 'rails_helper'

RSpec.describe InterestsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:ride) { create(:ride, user_id: user.id) }

  describe "GET #index" do
    it "redirects to login when not signed in" do
      get :index
      expect(response).to have_http_status(302)
    end

    it "renders index page" do
      sign_in

      user_mailer(user)

      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
  end

  describe "DELETE destroy" do
    it "deletes interest from the database" do
      create(:interest, user_id: user.id, ride_id: ride.id)
      sign_in

      user_mailer(user)

      delete :destroy, params: { id: ride.id }

      expect(response).to have_http_status(302)
      expect(response).to be_redirect
    end

    it "cannot delete unknown interest" do
      sign_in

      delete :destroy, params: { id: 0 }

      expect(response).to have_http_status(404)
      expect(response.body).to include("http://test.host/interests")
    end
  end
end
