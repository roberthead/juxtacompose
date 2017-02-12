require 'rails_helper'

describe Theory::Pitch do
  subject(:pitch) { Theory::Pitch.get('G#3') }

  it { is_expected.to be == 'G#3' }
  it { is_expected.not_to be == 'Ab3' }

  it { is_expected.to be < Theory::Pitch.get('D4') }
  it { is_expected.to be > Theory::Pitch.get('D3') }

  it { is_expected.to be_enharmonic(Theory::Pitch.get('Ab3')) }
  it { is_expected.not_to be_enharmonic(Theory::Pitch.get('C7')) }
  it { is_expected.not_to be_enharmonic(Theory::Pitch.get('G#4')) }

  describe 'construction from a string' do
    context "for 'C'" do
      subject(:spelling) { Theory::Pitch.get('C4') }

      its(:letter) { is_expected.to eq 'C' }
      its(:accidental) { is_expected.to eq '' }
      its(:pitch_class) { is_expected.to eq 0 }
      its(:octave) { is_expected.to eq 4 }
      its(:midi_note_number) { is_expected.to eq 60 }
      it { is_expected.to eq 'C4' }
    end

    context "for 'F#-1'" do
      subject(:spelling) { Theory::Pitch.get('F#-1') }

      its(:letter) { is_expected.to eq 'F' }
      its(:accidental) { is_expected.to eq '#' }
      its(:pitch_class) { is_expected.to eq 6 }
      its(:octave) { is_expected.to eq -1 }
      its(:midi_note_number) { is_expected.to eq 6 }
      it { is_expected.to eq 'F#-1' }
    end

    context "for 'Bb5'" do
      subject(:spelling) { Theory::Pitch.get('Bb5') }

      its(:letter) { is_expected.to eq 'B' }
      its(:accidental) { is_expected.to eq 'b' }
      its(:pitch_class) { is_expected.to eq 10 }
      its(:octave) { is_expected.to eq 5 }
      its(:midi_note_number) { is_expected.to eq 82 }
      it { is_expected.to eq 'Bb5' }
    end

    context "for 'Eb7'" do
      subject(:spelling) { Theory::Pitch.get('Eb7') }

      its(:letter) { is_expected.to eq 'E' }
      its(:accidental) { is_expected.to eq 'b' }
      its(:pitch_class) { is_expected.to eq 3 }
      its(:octave) { is_expected.to eq 7 }
      its(:midi_note_number) { is_expected.to eq 99 }
      it { is_expected.to eq 'Eb7' }
    end

    context "for 'biscuit'" do
      subject(:spelling) { Theory::Pitch.get('biscuit') }

      it { is_expected.to be_blank }
    end
  end

  describe 'construction from a number' do
    specify { expect(Theory::Pitch.from_number(60)).to eq 'C4' }
    specify { expect(Theory::Pitch.from_number(70)).to eq 'A#4' }
  end
end
