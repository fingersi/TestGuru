class ChangeDefaultForUserType < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :type, "User"
  end
end
