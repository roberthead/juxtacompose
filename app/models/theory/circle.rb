class Theory::Circle
  attr_reader :pitch_classes

  def initialize
    assign_pitch_classes
  end

  private

  def assign_pitch_classes
    @pitch_classes = [Theory::PitchClass.new(0)]
    loop do
      @pitch_classes << @pitch_classes.last + Theory::Interval.for_semitones(7)
      break if @pitch_classes.first == @pitch_classes.last
    end
  end
end
