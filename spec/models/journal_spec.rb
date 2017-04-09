require 'rails_helper'

RSpec.describe Journal, type: :model do


  describe 'validations' do

    it "requires a user" do
      journal = Journal.new
      expect(journal.valid?).to eq(false)
      expect(journal.errors.full_messages).to eq([ "User must exist" ])
    end

    it "has a vaild name" do
      user = User.create(name: "bri", email: "me@fi.com", password: "password")
      journal = build(:journal)
      journal.user = user
      journal.save
      expect(journal).to be_valid

    end
  end

  describe "relationships" do

    it "belongs to a user" do
      user = User.create(name: "bri", email: "me@me.com", password: "password")
      journal = build(:journal)
      journal.user = user
      # binding.pry
      journal.save
      expect(journal.user).to eq(user)
    end

    it "has many entries"

    it "has many entry_activities through entry"
  end
end
