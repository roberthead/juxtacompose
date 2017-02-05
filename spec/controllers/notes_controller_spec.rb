require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns notes array" do
      get :index
      expect(assigns(:notes)).to be_an(Array)
    end
  end
end
