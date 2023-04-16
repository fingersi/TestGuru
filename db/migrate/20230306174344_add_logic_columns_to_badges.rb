class AddLogicColumnsToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :category_condition, :boolean, default: false
    add_column :badges, :level_condition, :boolean, default: false
    add_column :badges, :level, :integer, default: 0
    add_column :badges, :first_time, :boolean, default: false
  end
end
