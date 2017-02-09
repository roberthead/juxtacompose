require 'rails_helper'

describe Theory::Spelling do
  describe '.pitch_class' do
    context "for 'C'" do
      subject(:spelling) { Theory::Spelling.get('C') }

      its(:letter) { is_expected.to eq 'C' }
      its(:accidental) { is_expected.to eq '' }
      its(:pitch_class) { is_expected.to eq 0 }
      it { is_expected.to eq 'C' }
    end

    context "for 'F#'" do
      subject(:spelling) { Theory::Spelling.get('F#') }

      its(:letter) { is_expected.to eq 'F' }
      its(:accidental) { is_expected.to eq '#' }
      its(:pitch_class) { is_expected.to eq 6 }
      it { is_expected.to eq 'F#' }
    end

    context "for 'Bb'" do
      subject(:spelling) { Theory::Spelling.get('Bb') }

      its(:letter) { is_expected.to eq 'B' }
      its(:accidental) { is_expected.to eq 'b' }
      its(:pitch_class) { is_expected.to eq 10 }
      it { is_expected.to eq 'Bb' }
    end
  end
end
