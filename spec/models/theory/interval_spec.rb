require 'rails_helper'

RSpec.describe Theory::Interval do
  let(:major_third) { Theory::Interval.major_third }
  let(:minor_third) { Theory::Interval.minor_third }
  let(:perfect_fifth) { Theory::Interval.perfect_fifth }

  specify { expect(major_third).to be > minor_third }

  specify { expect(major_third + minor_third).to eq perfect_fifth }

  specify { expect(perfect_fifth - minor_third).to eq major_third }
end
