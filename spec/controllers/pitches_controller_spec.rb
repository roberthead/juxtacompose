require 'rails_helper'

RSpec.describe PitchesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns pitches' do
      get :index
      pitches = assigns(:pitches)
      expect(pitches).to be_an Array
      expect(pitches.length).to eq 128
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: {id: 'D#4'}
      expect(response).to have_http_status(:success)
    end
  end
end
