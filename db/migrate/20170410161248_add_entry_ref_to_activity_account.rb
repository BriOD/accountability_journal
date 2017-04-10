class AddEntryRefToActivityAccount < ActiveRecord::Migration[5.0]
  def change
    add_reference :activity_accounts, :entry, foreign_key: true
  end
end
