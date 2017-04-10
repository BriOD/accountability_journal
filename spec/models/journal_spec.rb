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

    it "has many entries" do

      journal = create(:journal)
      entry1 = create(:entry)
      entry2 = create(:entry)
      entry1.journal = journal
      entry1.save
      entry2.journal = journal
      entry2.save

      expect(journal.entries.first).to eq(entry1)
      expect(journal.entries.last).to eq(entry2)
    end

    it "has many entry_activities through entry" do
      user = User.create(name: "bri", email: "you@me.com", password: "password")
      journal = create(:journal)
      journal.user = user
      entry = create(:entry)
      entry.journal = journal
      entry.save
      aa1 = create(:activity_account)
      aa2 = create(:activity_account)
      aa1.entry = entry
      aa1.save
      aa2.entry = entry
      aa2.save
      # binding.pry

      expect(journal.entries.first.activity_accounts.first).to eq(aa1)
      expect(journal.entries.first.activity_accounts.last).to eq(aa2)
    end
  end
end
