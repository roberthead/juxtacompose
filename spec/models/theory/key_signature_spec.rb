require 'rails_helper'

RSpec.describe Theory::KeySignature do
  subject(:key_signature) { Theory::KeySignature.new(tonic) }

  context 'in the key of C major' do
    let(:tonic) { Theory::Spelling.get('C') }

    specify { expect(key_signature.num_sharps).to eq 0 }
    specify { expect(key_signature.num_flats).to eq 0 }
  end

  context 'in the key of D#/Eb major' do
    let(:tonic) { Theory::Spelling.get('Eb') }

    specify { expect(key_signature.num_sharps).to eq 9 }
    specify { expect(key_signature.num_flats).to eq 3 }

    specify { expect(key_signature.flats).to eq ['Bb', 'Eb', 'Ab'] }
  end
end
