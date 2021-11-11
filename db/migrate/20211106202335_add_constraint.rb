class AddConstraint < ActiveRecord::Migration[6.1]
  def up
    add_check_constraint :tests, 'level >= 0', name: 'check_level_positive'
  end

  def down
    remove_check_constraint :tests, name: 'check_level_positive'
  end
end
