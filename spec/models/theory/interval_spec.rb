require 'rails_helper'

RSpec.describe Theory::Interval do
  let(:perfect_unison) { Theory::Interval.named(:perfect_unison) }
  let(:major_third) { Theory::Interval.named(:major_third) }
  let(:minor_third) { Theory::Interval.named(:minor_third) }
  let(:perfect_fourth) { Theory::Interval.named(:perfect_fourth) }
  let(:perfect_fifth) { Theory::Interval.named(:perfect_fifth) }
  let(:perfect_octave) { Theory::Interval.named(:perfect_octave) }
  let(:perfect_11th) { Theory::Interval.for_semitones(17) }

  specify { expect(major_third).to be > minor_third }

  specify { expect(major_third + minor_third).to eq perfect_fifth }

  specify { expect(perfect_fifth - minor_third).to eq major_third }

  specify { expect(perfect_unison).to be_simple }
  specify { expect(major_third).to be_simple }
  specify { expect(perfect_octave).to be_simple }
  specify { expect(perfect_11th).not_to be_simple }

  specify { expect(perfect_unison).not_to be_compound }
  specify { expect(major_third).not_to be_compound }
  specify { expect(perfect_octave).not_to be_compound }
  specify { expect(perfect_11th).to be_compound }

  specify { expect(perfect_11th.simplified).to eq(perfect_fourth) }
end
