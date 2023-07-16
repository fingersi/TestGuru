class CreateJoinTableTestPassingBadge < ActiveRecord::Migration[6.1]
  def change
    create_join_table :test_passings, :badges do |t|
      t.index [:test_passing_id, :badge_id]
      # t.index [:badge_id, :testpassing_id]
    end
  end
end
