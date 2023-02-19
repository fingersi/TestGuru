class ChangeDefaultForUserType < ActiveRecord::Migration[6.1]
  def self.up
    change_column_default :users, :type, "User"
  end

  def self.down
    change_column_default :users, :type, "user"
  end
end
