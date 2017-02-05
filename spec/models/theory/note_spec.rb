require 'rails_helper'

RSpec.describe Theory::Note do
  subject(:note) { Theory::Note.from_latin('D4') }

  specify { expect(note.midi).to eq(62) }
end
