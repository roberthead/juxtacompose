class Theory::Circle
  def self.of_fifths
    by_interval(Theory::Interval.named(:perfect_fifth))
  end

  def self.by_interval(interval)
    @circles ||= {}
    @circles[interval.to_i] ||= new(interval)
  end

  attr_reader :interval, :pitch_classes

  def initialize(interval)
    @interval = Theory::Interval.get(interval.to_i)
    @pitch_classes = pitch_classes_by_interval(interval)
  end

  private_class_method :new

  private

  def pitch_classes_by_interval(interval)
    [Theory::PitchClass.get(0)].tap do |list|
      loop do
        next_pitch_class = list.last + interval
        break if next_pitch_class == list.first
        list << next_pitch_class
      end
    end
  end
end
