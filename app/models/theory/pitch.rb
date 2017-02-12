class Theory::Pitch
  include Comparable

  attr_reader :spelling
  attr_reader :octave

  delegate :letter, :accidental, :pitch_class, to: :spelling

  def self.get(value)
    @pitches ||= {}
    @pitches[value] ||= from_name(value) || from_number(value)
  end

  def self.from_name(name)
    return nil unless name == name.to_s
    spelling = Theory::Spelling.get(name)
    octave = name.scan(/-?\d+$/).first.to_i
    new(spelling, octave) if spelling.present? && octave.in?(-1..9)
  end

  def self.from_number(number)
    return nil unless number == number.to_i
    spelling = Theory::Spelling.from_number(number)
    octave = (number.to_i / 12) - 1
    new(spelling, octave) if spelling.present? && octave.in?(-1..9)
  end

  def initialize(spelling, octave)
    @spelling = Theory::Spelling.get(spelling.to_s)
    @octave = octave.to_i
  end

  def name
    [spelling, octave].join
  end

  def midi_note_number
    (octave + 1) * 12 + pitch_class.to_i
  end

  def to_s
    name
  end

  def to_i
    midi_note_number
  end

  def enharmonic?(other)
    self.midi_note_number == other.midi_note_number
  end

  def ==(value)
    to_s == value.to_s
  end

  def <=>(other)
    self.midi_note_number <=> other.midi_note_number
  end

  private_class_method :new
end
