require 'rails_helper'

RSpec.describe Theory::Circle do
  subject(:circle) { Theory::Circle.of_fifths }

  describe '.pitch_classes' do
    it 'lists all the pitch classes starting and ending at C' do
      expect(circle.pitch_classes).to eq([
        Theory::PitchClass.get(0),
        Theory::PitchClass.get(7),
        Theory::PitchClass.get(2),
        Theory::PitchClass.get(9),
        Theory::PitchClass.get(4),
        Theory::PitchClass.get(11),
        Theory::PitchClass.get(6),
        Theory::PitchClass.get(1),
        Theory::PitchClass.get(8),
        Theory::PitchClass.get(3),
        Theory::PitchClass.get(10),
        Theory::PitchClass.get(5),
      ])
    end
  end
end
