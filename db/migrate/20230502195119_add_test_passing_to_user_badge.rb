class AddTestPassingToUserBadge < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_badges, :test_passing, index: true, foreign_key: true
  end
end
