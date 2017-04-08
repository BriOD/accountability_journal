class CreateActivityAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_accounts do |t|
      t.string :daily_activity
      t.boolean :completion
      t.string :duration
      t.text :notes

      t.timestamps
    end
  end
end
