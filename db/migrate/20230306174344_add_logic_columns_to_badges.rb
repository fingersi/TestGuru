class AddLogicColumnsToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :category, :string, default: 'none'
    add_column :badges, :level, :string, default: 'none'
    add_column :badges, :first_time, :string, default: 'none'
  end
end
