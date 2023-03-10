require 'rails_helper'

RSpec.describe Perfect, type: :model do
  describe 'If adding with similar params' do
    before do
      Perfect.create!(input: "1 2 6 28 5 496 13 25") if Perfect.find_by(input: "1 2 6 28 5 496 13 25").nil?
    end
    it 'should be error if input is not unique' do
      Perfect.where(input: "1 2 6 28 5 496 13 25").should exist
    end
  end

end
