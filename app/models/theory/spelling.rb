# A Spelling is a pitch class with a letter and an accidental

class Theory::Spelling
  attr_reader :letter
  attr_reader :accidental
  attr_reader :pitch_class

  delegate :blank?, to: :name

  SPELLING_MATCHER = /([A-G])([b#]*)(\-?\d+)?/

  def self.get(identifier)
    @spellings ||= {}
    @spellings[identifier] ||= from_name(identifier) || from_number(identifier)
  end

  def self.from_name(name)
    return nil unless name == name.to_s
    match = name.match(SPELLING_MATCHER)
    if match
      letter_name, accidental_string, _octave = match.captures
      letter = Theory::Letter.get(letter_name)
      if letter.present?
        return new(letter, Theory::Accidental.get(accidental_string))
      end
    end
  end

  def self.from_number(number)
    return nil unless number == number.to_i
    pitch_class_number = number % 12
    letter = Theory::Letter.from_pitch_class(pitch_class_number)
    if letter.pitch_class != pitch_class_number
      accidental = Theory::Accidental.for_interval(pitch_class_number - letter.pitch_class.to_i)
    end
    new(letter, accidental)
  end

  def initialize(letter, accidental = nil)
    @letter = Theory::Letter.get(letter.to_s)
    @accidental = Theory::Accidental.get(accidental.to_s)
    @pitch_class = Theory::PitchClass.get(letter.pitch_class + accidental.try(:semitones))
  end

  def name
    [letter, accidental].join
  end

  def to_s
    name
  end

  def ==(value)
    to_s == value.to_s
  end

  private_class_method :new
end
