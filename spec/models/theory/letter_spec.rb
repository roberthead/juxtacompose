require 'rails_helper'

describe Theory::Letter do
  context "fetched with 'A'" do
    subject(:letter) { Theory::Letter.get('A') }

    specify { expect(letter.pitch_class).to eq 9 }
    specify { expect(letter).to eq 'A' }
  end

  context "fetched with 'c#7'" do
    subject(:letter) { Theory::Letter.get('d#7') }

    specify { expect(letter.pitch_class).to eq 2 }
    specify { expect(letter).to eq 'D' }
  end

  context "fetched with 'h'" do
    subject(:letter) { Theory::Letter.get('h') }

    specify { expect(letter.pitch_class).to eq 11 }
    specify { expect(letter).to eq 'B' }
  end

  context "fetched with 'X'" do
    subject(:letter) { Theory::Letter.get('X') }

    specify { expect(letter).to be_nil }
  end
end
