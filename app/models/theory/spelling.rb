class Theory::Spelling
  SHARP_SPELLINGS = %w{C C# D D# E F F# G G# A A# B}
  FLAT_SPELLINGS = %w{C Db D Eb E F Gb G Ab A Bb B}

  def initialize(pitch_class, spelling_type = nil)
    @pitch_class = pitch_class
    @spelling_type = spelling_type || Theory::KeySignature.new(pitch_class).default_spelling_type
  end

  def to_s
    if spelling_type.flats?
      FLAT_SPELLINGS[pitch_class.number]
    else
      SHARP_SPELLINGS[pitch_class.number]
    end
  end
end
