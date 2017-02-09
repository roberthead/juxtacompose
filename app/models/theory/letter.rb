class Theory::Letter
  # Defines the natural relationship between the natural letter-named notes

  NAMES = ('A'..'G').to_a

  NATURAL_PITCH_CLASS_NUMBERS = {
    'C' => 0,
    'D' => 2,
    'E' => 4,
    'F' => 5,
    'G' => 7,
    'A' => 9,
    'B' => 11,
  }

  def self.all
    NAMES.map { |letter_name| get(letter_name)}
  end

  def self.get(name)
    @letters ||= {}
    name = name.to_s.first.upcase
    if name.in?(NAMES)
      @letters[name] ||= new(name)
    end
  end

  attr_reader :name

  delegate :to_s, to: :name
  delegate :to_sym, to: :name
  delegate :to_i, to: :pitch_class

  def initialize(name)
    @name = name
  end

  def pitch_class
    NATURAL_PITCH_CLASS_NUMBERS[name]
  end

  def ==(value)
    to_s == value.to_s
  end

  private_class_method :new
end
