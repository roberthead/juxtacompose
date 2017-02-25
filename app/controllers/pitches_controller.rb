class PitchesController < ApplicationController
  def index
    @pitches = (0..127).map { |i| HeadMusic::Pitch.get(i) }
  end
end
