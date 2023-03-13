class AddActivatedToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :activated, :boolean, default: false
  end
end
