module Theory
  class Note
    PITCH_CLASS_SHARP_NAMES = %w{C C# D D# E F F# G G# A A# B}
    PITCH_CLASS_FLAT_NAMES = %w{C Db D Eb E F Gb G Ab A Bb B}

    attr_reader :midi, :name

    def self.from_name(name)
      notes[midi_from_name(name)]
    end

    def self.notes
      @notes ||= (0..127).map { |midi_note| Note.new(midi_note) }
    end

    def self.midi_from_name(name)
      @midi_from_name_memo ||= {}
      @midi_from_name_memo[name] ||=
        (octave_for_name(name).to_i + 1) * 12 + pitch_class_for_name(name)
    end

    def self.pitch_class_for_name(name)
      pitch_class_name = pitch_class_name_for_name(name)
      PITCH_CLASS_SHARP_NAMES.index(pitch_class_name) ||
        PITCH_CLASS_FLAT_NAMES.index(pitch_class_name)
    end

    def self.pitch_class_name_for_name(name)
      name.sub(octave_for_name(name), '')
    end

    def self.octave_for_name(name)
      (name[-2..-2] == '-' ? name[-2..-1] : name.last)
    end

    def initialize(midi_number)
      @midi = midi_number.to_i
      @name = build_name
    end

    def pitch_class
      midi % 12
    end

    def octave
      (midi / 12) - 1
    end

    def pitch_class_name
      PITCH_CLASS_SHARP_NAMES[pitch_class]
    end

    alias_method :scientific_pitch_notation, :name

    private

    def build_name
      pitch_class_name + octave.to_s
    end
  end
end
