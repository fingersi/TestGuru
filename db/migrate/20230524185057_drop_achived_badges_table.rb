class DropAchivedBadgesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :achived_badges do |t|
      t.reference :badge_id, null: false
      t.reference :user_id, null: false
    end
  end
end