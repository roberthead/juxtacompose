module Theory
  class Note
    PITCH_CLASS_NAMES_WITH_SHARPS = %w{C C# D D# E F F# G G# A A# B}

    attr_reader :midi

    def initialize(midi_number)
      @midi = midi_number.to_i
    end

    def pitch_class
      midi % 12
    end

    def octave
      (midi / 12) - 1
    end

    def latin
      PITCH_CLASS_NAMES_WITH_SHARPS[pitch_class] + octave.to_s
    end

    def self.from_latin(latin)
      notes.detect { |note| note.latin == latin.upcase.strip }
    end

    def self.notes
      @notes ||= (0..127).map { |midi_note| Note.new(midi_note) }
    end
  end
end
