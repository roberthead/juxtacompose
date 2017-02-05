require 'rails_helper'

RSpec.describe Theory::Note do
  context 'Given a note constructed from a name' do
    subject(:note) { Theory::Note.from_name('D4') }

    specify { expect(note.midi).to eq(62) }
  end

  context 'Given a note constructed from a midi note number' do
    subject(:note) { Theory::Note.new(99) }

    describe '.scientific_pitch_notation' do
      specify { expect(note.scientific_pitch_notation).to eq('D#7') }
    end
  end

  describe '.midi_from_name' do
    specify { expect(Theory::Note.midi_from_name('A#3')).to eq (58) }
    specify { expect(Theory::Note.midi_from_name('Eb4')).to eq (63) }
    specify { expect(Theory::Note.midi_from_name('G-1')).to eq (7) }
  end

  describe '.from_name' do
    it 'returns a Note object' do
      expect(Theory::Note.from_name('A#7')).to be_a(Theory::Note)
    end

    it 'returns the correct note' do
      expect(Theory::Note.from_name('A#7').midi).to eq(106)
    end
  end
end
