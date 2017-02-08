class Theory::PitchClass
  attr_reader :number

  def self.get(number)
    @pitch_classes ||= {}
    number %= 12
    @pitch_classes[number] ||= new(number)
  end

  class << self
    alias_method :[], :get
  end

  def initialize(pitch_class_or_midi_number)
    @number = pitch_class_or_midi_number % 12
  end

  def to_i
    number
  end

  def +(semitones)
    Theory::PitchClass.get(to_i + semitones.to_i)
  end

  def -(semitones)
    Theory::PitchClass.get(to_i - semitones.to_i)
  end

  def ==(value)
    to_i == value.to_i
  end

  private_class_method :new
end
