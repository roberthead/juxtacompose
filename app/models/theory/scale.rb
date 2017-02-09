class Theory::Scale
  PATTERNS = {
    major: [0, 2, 4, 5, 7, 9, 11, 12],
    minor_pentatonic: [0, nil, 3, 5, 7, nil, 10, 12],
  }

  attr_reader :pattern

  def self.major
    @scales ||= {}
    @scales[:major] ||=  new(PATTERNS[:major])
  end

  def self.minor_pentatonic
    @scales ||= {}
    @scales[:minor_pentatonic] ||=  new(PATTERNS[:minor_pentatonic])
  end

  def initialize(pattern)
    @pattern = pattern
  end

  def in(spelling)
    spelling = Theory::Spelling.get(spelling.to_s)
    spellings = []
    letter_index = Theory::Letter::all.index(spelling.letter)
    starting_pitch_class = spelling.pitch_class
    pattern.each do |interval_from_tonic|
      letter = Theory::Letter.all[letter_index]
      if interval_from_tonic
        accidental = Theory::Accidental.for_interval((starting_pitch_class + interval_from_tonic) % 12 - letter.pitch_class)
        spellings << Theory::Spelling.get([letter, accidental].join)
      end
      letter_index = (letter_index + 1) % 7
    end
    spellings
  end
end
