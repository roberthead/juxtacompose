module Theory
  class Note
    include Comparable

    def self.from_name(name)
      notes[midi_from_name(name)]
    end

    def self.notes
      @notes ||= (0..127).map { |midi_note| Note.new(midi_note) }
    end

    def self.midi_from_name(name)
      @midi_from_name_memo ||= {}
      @midi_from_name_memo[name] ||= begin
        octave = (name[-2..-2] == '-' ? name[-2..-1] : name.last).to_i
        pitch_class_number = PitchClass.for_note_name(name).number
        (octave + 1) * 12 + pitch_class_number
      end
    end

    attr_reader :midi
    attr_reader :name
    attr_reader :pitch_class

    alias_method :scientific_pitch_notation, :name

    def initialize(midi_number, key_signature_type = :sharp)
      @midi = midi_number.to_i
      @pitch_class = PitchClass.new(midi)
      @name = build_name
    end

    def octave
      (midi / 12) - 1
    end

    def to_i
      midi
    end

    def <=>(other)
      self.midi <=> other.midi
    end

    private

    def build_name
      pitch_class.sharp_spelling + octave.to_s
    end
  end
end
