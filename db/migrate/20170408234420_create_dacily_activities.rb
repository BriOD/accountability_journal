class CreateDacilyActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :dacily_activities do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
