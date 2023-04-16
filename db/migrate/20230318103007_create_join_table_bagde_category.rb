class CreateJoinTableBagdeCategory < ActiveRecord::Migration[6.1]
  def change
    create_join_table :badges, :categories do |t|
      t.index [:badge_id, :category_id]
      # t.index [:category_id, :badge_id]
    end
  end
end
