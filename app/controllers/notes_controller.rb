class NotesController < ApplicationController
  def index
    @notes = Theory::Note.notes
  end
end
