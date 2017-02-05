require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryGirl.create(:user) }

  describe 'factory-generated User' do
    it 'is valid' do
      expect(user).to be_valid
    end
  end
end
