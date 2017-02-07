require 'rails_helper'

RSpec.describe Theory::Interval do
  let(:major_third) { Theory::Interval.named(:major_third) }
  let(:minor_third) { Theory::Interval.named(:minor_third) }
  let(:perfect_fifth) { Theory::Interval.named(:perfect_fifth) }

  specify { expect(major_third).to be > minor_third }

  specify { expect(major_third + minor_third).to eq perfect_fifth }

  specify { expect(perfect_fifth - minor_third).to eq major_third }
end
