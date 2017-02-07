require 'rails_helper'

RSpec.describe Theory::PitchClass do
  describe 'spellings' do
    specify { expect(described_class.new(60).sharp_spelling).to eq('C') }
    specify { expect(described_class.new(60).flat_spelling).to eq('C') }

    specify { expect(described_class.new(61).sharp_spelling).to eq('C#') }
    specify { expect(described_class.new(61).flat_spelling).to eq('Db') }
  end

  describe '.for_note_name' do
    specify { expect(Theory::PitchClass.for_note_name('D#').number).to eq 3 }
    specify { expect(Theory::PitchClass.for_note_name('Ab5').number).to eq 8 }
  end

  describe '.+' do
    specify { expect(described_class.new(60) + 3).to eq described_class.new(63)}
  end
end
