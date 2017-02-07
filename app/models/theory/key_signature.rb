class Theory::KeySignature
  attr_reader :tonic
  attr_reader :scale_type

  SHARPS = %w{F# C# G# D# A# E# B#}
  FLATS = %w{Bb Eb Ab Db Gb Cb Fb}

  def initialize(tonic, scale_type = :major)
    @tonic = tonic
    @scale_type = scale_type
  end

  def sharps
    SHARPS.first(num_sharps)
  end

  def flats
    FLATS.first(num_flats)
  end

  def num_sharps
    (circle_pitch_classes.index(tonic) - scale_type_adjustment) % 12
  end

  def num_flats
    (circle_pitch_classes.reverse.index(tonic) + scale_type_adjustment) % 12
  end

  def default_spelling_type
    return :flats if num_flats < num_sharps
    :sharps
  end

  private

  def circle_pitch_classes
    @circle_pitch_classes ||= Theory::Circle.new().pitch_classes
  end

  def scale_type_adjustment
    scale_type == :minor ? 3 : 0
  end
end
