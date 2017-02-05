require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "assigns notes array" do
      get :show
      expect(assigns(:notes)).to be_an(Array)
    end
  end
end
