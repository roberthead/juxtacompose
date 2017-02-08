require 'rails_helper'

RSpec.describe Theory::PitchClass do
  subject(:pitch_class) { Theory::PitchClass.get(number) }

  context 'when constructed with a number between zero and eleven' do
    let(:number) { rand(12) }

    specify { expect(pitch_class.number).to eq number }
    specify { expect(pitch_class.to_i).to eq number }
  end

  context 'when constructed with a midi note number' do
    let(:number) { 53 } # F3

    specify { expect(pitch_class.number).to eq 5 } # F
    specify { expect(pitch_class).to eq 5 }
  end

  describe 'equality' do
    specify { expect(Theory::PitchClass.get(53)).to eq Theory::PitchClass.get(5) }
  end

  describe '.+' do
    specify { expect(Theory::PitchClass.get(60) + 3).to eq Theory::PitchClass.get(63) }
    specify { expect(Theory::PitchClass.get(4) + Theory::Interval.for_semitones(3)).to eq Theory::PitchClass.get(7) }
  end

  describe '.-' do
    specify { expect(Theory::PitchClass.get(60) - 3).to eq Theory::PitchClass.get(57) }
    specify { expect(Theory::PitchClass.get(4) - Theory::Interval.for_semitones(3)).to eq Theory::PitchClass.get(1) }
  end
end
