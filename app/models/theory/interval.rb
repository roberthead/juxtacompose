class Theory::Interval
  include Comparable

  NAMES = %w{unison minor_second major_second minor_third major_third perfect_fourth tritone perfect_fifth minor_sixth major_sixth minor_seventh major_seventh perfect_octave}

  NAMES.each_with_index do |name, semitones|
    define_singleton_method name do
      new(semitones)
    end
  end

  attr_reader :semitones

  def initialize(semitones)
    @semitones = semitones
  end

  def to_i
    semitones
  end

  def +(value)
    Theory::Interval.new(to_i + value.to_i)
  end

  def -(value)
    Theory::Interval.new((to_i - value.to_i).abs)
  end

  def <=>(other)
    self.to_i <=> other.to_i
  end
end
