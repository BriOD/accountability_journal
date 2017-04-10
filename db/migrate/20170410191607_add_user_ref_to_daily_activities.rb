class AddUserRefToDailyActivities < ActiveRecord::Migration[5.0]
  def change
    add_reference :daily_activities, :user, foreign_key: true
  end
end
