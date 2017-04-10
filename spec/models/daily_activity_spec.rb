require 'rails_helper'

RSpec.describe DailyActivity, type: :model do

  describe "validations" do
    it "requires a name, and description" do
      daily_activity = DailyActivity.new

      expect(daily_activity.valid?).to eq(false)
      expect(daily_activity.errors.full_messages).to eq([
        "User must exist",
        "Name can't be blank",
        "Description can't be blank",
      ])
    end


  end

  describe "relationships" do
    it "belongs to a user" do
      # user = User.create(name: "b", email: "we@we.com", password: "password")
      user = create(:user, email: "brian2@aol.com")
      d_a = build(:daily_activity)
      d_a.user = user
      d_a.save
      expect(d_a.user).to eq(user)

    end


  end


end
