require 'rails_helper'

describe Theory::Scale do
  describe 'major scale' do
    subject(:scale) { Theory::Scale.major }

    specify { expect(scale.in('D')).to eq %w{D E F# G A B C# D} }
    specify { expect(scale.in('Ab')).to eq %w{Ab Bb C Db Eb F G Ab} }
  end

  describe 'minor pentatonic scale' do
    subject(:scale) { Theory::Scale.minor_pentatonic }

    specify { expect(scale.in('C')).to eq %w{C Eb F G Bb C} }
  end
end
