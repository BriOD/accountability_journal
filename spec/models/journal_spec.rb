require 'rails_helper'

RSpec.describe Journal, type: :model do


  describe 'validations' do

    it "requires a user" do
      journal = Journal.new
      expect(journal.valid?).to eq(false)
      expect(journal.errors.full_messages).to eq([ "User must exist" ])
    end

    it "has a vaild name" do
      journal = build(:journal)
      user = create(:user)
      journal.user = user
      journal.save
      expect(journal).to be_valid
    end

  end
end
