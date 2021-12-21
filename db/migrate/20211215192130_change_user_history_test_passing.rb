class ChangeUserHistoryTestPassing < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_histories, :test_passings
  end
end
