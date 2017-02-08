require 'rails_helper'

RSpec.describe Theory::Accidental do
  subject(:accidental) {  }

  describe '.semitones' do
    specify { expect(Theory::Accidental.get('#').semitones).to eq 1 }
    specify { expect(Theory::Accidental.get('##').semitones).to eq 2 }
    specify { expect(Theory::Accidental.get('b').semitones).to eq -1 }
    specify { expect(Theory::Accidental.get('bb').semitones).to eq -2 }
    specify { expect(Theory::Accidental.get('foo').semitones).to eq 0 }
    specify { expect(Theory::Accidental.get(nil).semitones).to eq 0 }
    specify { expect(Theory::Accidental.get('').semitones).to eq 0 }
  end

  describe 'equality' do
    specify { expect(Theory::Accidental.get('#')).to eq '#' }
    specify { expect(Theory::Accidental.get('bb')).to eq 'bb' }
  end
end
