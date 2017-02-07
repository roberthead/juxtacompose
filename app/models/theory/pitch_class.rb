class Theory::PitchClass
  attr_reader :number

  SHARP_SPELLINGS = %w{C C# D D# E F F# G G# A A# B}
  FLAT_SPELLINGS = %w{C Db D Eb E F Gb G Ab A Bb B}

  def initialize(pitch_class_or_midi_number)
    @number = pitch_class_or_midi_number % 12
  end

  def sharp_spelling
    SHARP_SPELLINGS[number]
  end

  def flat_spelling
    FLAT_SPELLINGS[number]
  end

  def ==(value)
    to_i == value.to_i
  end

  def to_i
    number
  end

  def +(value)
    Theory::PitchClass.new(number + value.to_i)
  end

  def self.for_note_name(note_name)
    pitch_class_name = note_name.sub(/\-?\d$/, '')
    new(SHARP_SPELLINGS.index(pitch_class_name) || FLAT_SPELLINGS.index(pitch_class_name))
  end
end
