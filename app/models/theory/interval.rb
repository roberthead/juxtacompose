class Theory::Interval
  include Comparable

  private_class_method :new

  NAMES = %w{unison minor_second major_second minor_third major_third perfect_fourth tritone perfect_fifth minor_sixth major_sixth minor_seventh major_seventh perfect_octave}

  attr_reader :semitones

  def self.for_semitones(semitones)
    @intervals_memo ||= {}
    @intervals_memo[semitones] ||= new(semitones)
  end

  def self.named(name)
    name = name.to_s
    for_semitones(NAMES.index(name)) if name.in?(NAMES)
  end

  def initialize(semitones)
    @semitones = semitones
  end

  def simplified
    Theory::Interval.for_semitones(semitones % 12)
  end

  def compound?
    semitones > 12
  end

  def to_i
    semitones
  end

  def +(value)
    Theory::Interval.for_semitones(to_i + value.to_i)
  end

  def -(value)
    Theory::Interval.for_semitones((to_i - value.to_i).abs)
  end

  def <=>(other)
    self.to_i <=> other.to_i
  end
end
