class CreateUserHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :user_histories do |t|
      t.integer :user_id, null: false
      t.integer :test_id, null: false
      t.integer :level, null: false

      t.timestamps
    end
  end
end
