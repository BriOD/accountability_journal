class ChangeTableDacilyActivitiesToDailyActivities < ActiveRecord::Migration[5.0]
  def change
    rename_table :dacily_activities, :daily_activities 
  end
end
