require 'rails_helper'

RSpec.describe Score, type: :model do
  it { is_expected.to respond_to :name }

  describe 'factory' do
    subject(:score) { FactoryGirl.build(:score) }

    its(:name) { is_expected.to be_present }
  end
end
