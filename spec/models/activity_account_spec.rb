require 'rails_helper'

RSpec.describe ActivityAccount, type: :model do
  describe "validations" do


    it "requires a daily_activity, completion, duration" do
      activity_account = build(:activity_account)
      activity_account.daily_activity = nil
      activity_account.completion = nil
      activity_account.duration = nil


      expect(activity_account.valid?).to eq(false)
      expect(activity_account.errors.full_messages).to eq([
        "Daily activity can't be blank", "Completion can't be blank", "Duration can't be blank"
      ])
    end

    it "optional to add notes" do
      activity_account = build(:activity_account)
      activity_account.notes = nil

      expect(activity_account.valid?).to eq(true)
    end

  end

  describe "relationships" do
    it "belongs to an entry" do
      activity_account = create(:activity_account)

    end



  end
end
