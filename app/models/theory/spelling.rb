# A Spelling is a pitch class with a letter and an accidental

class Theory::Spelling
  attr_reader :letter
  attr_reader :accidental
  attr_reader :pitch_class

  def self.get(name)
    @spellings ||= {}
    if match = name.match(/([A-G])([b#]*)(\-?\d+)?/i)
      letter_name, accidental_string, _octave = match.captures
      letter = Theory::Letter.get(letter_name)
      accidental = Theory::Accidental.get(accidental_string)
      if letter.present?
        return @spellings[letter] ||= new(letter, accidental)
      end
    end
  end

  def initialize(letter, accidental = nil)
    @letter = Theory::Letter.get(letter.to_s)
    @accidental = Theory::Accidental.get(accidental.to_s)
    @pitch_class = letter.pitch_class + accidental.try(:semitones)
  end

  def to_s
    [letter, accidental].join
  end

  def ==(value)
    to_s == value.to_s
  end

  private_class_method :new
end
