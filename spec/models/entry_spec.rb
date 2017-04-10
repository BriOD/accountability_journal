require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe "validations" do
    it "requires a date" do
      entry = Entry.new

      expect(entry.valid?).to eq(false)
      expect(entry.errors.full_messages).to eq([
          "Date can't be blank"
        ])
    end

  end

  describe "relationships" do
    it "has many activity_accounts" do
      aa1 = create(:activity_account)
      aa2 = create(:activity_account)
      entry = create(:entry)
      aa1.entry = entry
      aa1.save
      aa2.entry = entry
      aa2.save

      expect(entry.activity_accounts.first).to eq(aa1)
      expect(entry.activity_accounts.last).to eq(aa2)

    end

    it "belongs to a journal" do
      journal = create(:journal)
      entry = create(:entry)
      entry.journal = journal

      expect(entry.journal.name).to eq("MyString")
    end

    it "belongs to a user through journal" do
      user = User.create(name: "peter", email: "peter@gmail.com", password: "password")
      journal = create(:journal)
      journal.user = user
      journal.save
      entry = create(:entry)
      entry.journal = journal

      expect(entry.user).to eq(user)
    end
  end
end
