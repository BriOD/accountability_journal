require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "has a vaild user factory, name, email, and password" do
      expect(build(:user)).to be_valid
    end

    it "is invalid without a name" do
      expect(build(:user, name: nil )).not_to be_valid
    end

    it "is invalid without a emial" do
      expect(build(:user, email: nil )).not_to be_valid
  end

    it "is invalid without a password" do
      expect(build(:user, password_digest: nil )).not_to be_valid
    end

    it "is only vaild when a password length is a minimum of 8 characters" do
      expect(build(:user, password: "123")).not_to be_valid
      expect(build(:user, password: "12345678")).to be_valid
    end

    it "requires a unique email" do
      create(:user, email: "bri@aol.com")
      user = build(:user, email: "bri@aol.com")
      user.valid?
      # binding.pry
      expect(user.errors.full_messages).to include("Email has already been taken")
    end

    it "encrypts the password upon saving" do
      user = build(:user)
      user.save
      expect(user.password_digest).to be_truthy
      expect(user.password_digest).not_to eq(user.password)
    end
end

  describe 'relationships' do

    it 'has one journal that is destroyed upon deletion of user' do
      user = create(:user)
      journal = user.create_journal(name: 'my journal')

      expect(user.journal.id).not_to eq(nil)

      user.destroy
      journal = Journal.find_by(id: journal.id)

      expect(journal).to eq(nil)
    end

    it "has many daily_activities"
  end
end
