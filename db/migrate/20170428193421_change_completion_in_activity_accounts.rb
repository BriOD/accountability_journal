class ChangeCompletionInActivityAccounts < ActiveRecord::Migration[5.0]
  def change
    change_column :activity_accounts, :completion, :string
  end
end
