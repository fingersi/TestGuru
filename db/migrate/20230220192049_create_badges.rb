class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string  :title, null: false
      t.integer :level
      t.boolean :first_time, default: false
      t.boolean :activated, default: false

      t.timestamps
    end
  end
end
