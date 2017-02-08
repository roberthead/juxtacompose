class Theory::Letter
  # Defines the natural relationship between the natural letter-named notes
  PITCH_CLASSES = {
    'C' => Theory::PitchClass.get(0),
    'D' => Theory::PitchClass.get(2),
    'E' => Theory::PitchClass.get(4),
    'F' => Theory::PitchClass.get(5),
    'G' => Theory::PitchClass.get(7),
    'A' => Theory::PitchClass.get(9),
    'B' => Theory::PitchClass.get(11),
  }

  def self.get(letter)
    @letters ||= {}
    letter = letter.to_s.first.upcase.sub(/H/, 'B')
    if letter.in?(PITCH_CLASSES.keys)
      @letters[letter] ||= new(letter)
    end
  end

  attr_reader :string

  delegate :to_s, to: :string
  delegate :to_i, to: :pitch_class
  delegate :to_sym, to: :string

  def initialize(string)
    @string = string
  end

  def pitch_class
    PITCH_CLASSES[string]
  end

  def ==(value)
    to_s == value.to_s
  end

  private_class_method :new
end
