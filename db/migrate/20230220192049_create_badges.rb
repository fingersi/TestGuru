class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string  :title, null: false
      t.boolean :activated, default: false
      t.string :picture_path
      t.string :condition
      t.string :value

      t.timestamps
    end
  end
end
