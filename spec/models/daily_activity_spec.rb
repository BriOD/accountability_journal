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

      d_a = create(:daily_activity)
      expect(d_a.user.name).to eq("Brian O'D")

    end


  end


end
