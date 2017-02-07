require 'rails_helper'

RSpec.describe Theory::KeySignature do
  subject(:key_signature) { Theory::KeySignature.new(pitch_class) }

  context 'in the key of C major' do
    let(:pitch_class) { Theory::PitchClass.for_note_name('C') }

    specify { expect(key_signature.num_sharps).to eq 0 }
    specify { expect(key_signature.num_flats).to eq 0 }
  end

  context 'in the key of D#/Eb major' do
    let(:pitch_class) { Theory::PitchClass.for_note_name('Eb') }

    specify { expect(key_signature.num_sharps).to eq 9 }
    specify { expect(key_signature.num_flats).to eq 3 }

    specify { expect(key_signature.flats).to eq ['Bb', 'Eb', 'Ab'] }
  end
end
