class Theory::Accidental
  ACCIDENTAL_SEMITONES = {
    '#' => 1,
    '##' => 2,
    'b' => -1,
    'bb' => -2
  }

  attr_reader :string

  def self.get(string)
    @accidentals ||= {}
    @accidentals[string] ||= new(string)
  end

  def initialize(string)
    @string = string
  end

  def to_s
    string
  end

  def ==(value)
    to_s == value.to_s
  end

  def semitones
    ACCIDENTAL_SEMITONES.fetch(string, 0)
  end

  private_class_method :new
end
