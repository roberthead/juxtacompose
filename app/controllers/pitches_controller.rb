class PitchesController < ApplicationController
  def index
    @pitches = (0..127).map { |i| Theory::Pitch.get(i) }
  end
end
