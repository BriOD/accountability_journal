class AddJournalRefToEntry < ActiveRecord::Migration[5.0]
  def change
    add_reference :entries, :journal, foreign_key: true
  end
end
