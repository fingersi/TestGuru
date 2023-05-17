class AddBadgesToTestPassings < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_passings, :badge, index: true, foreign_key: true
  end
end
