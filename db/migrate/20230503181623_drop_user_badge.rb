class DropUserBadge < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_badges
  end
end
