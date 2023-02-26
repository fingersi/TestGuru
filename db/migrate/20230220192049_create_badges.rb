class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :picture_path, null: false

      t.timestamps
    end
  end
end
