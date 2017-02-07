require 'rails_helper'

RSpec.describe Theory::Circle do
  subject(:circle) { Theory::Circle.new }

  describe '.pitch_classes' do
    it 'lists all the pitch classes starting and ending at C' do
      expect(circle.pitch_classes).to eq([
        Theory::PitchClass.new(0),
        Theory::PitchClass.new(7),
        Theory::PitchClass.new(2),
        Theory::PitchClass.new(9),
        Theory::PitchClass.new(4),
        Theory::PitchClass.new(11),
        Theory::PitchClass.new(6),
        Theory::PitchClass.new(1),
        Theory::PitchClass.new(8),
        Theory::PitchClass.new(3),
        Theory::PitchClass.new(10),
        Theory::PitchClass.new(5),
        Theory::PitchClass.new(0),
      ])
    end
  end
end
