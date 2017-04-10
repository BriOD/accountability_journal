class ChangeDateTypeInEntry < ActiveRecord::Migration[5.0]
  def change
    change_column :entries, :date, :string
  end
end
