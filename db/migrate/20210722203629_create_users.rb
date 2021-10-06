class CreateUsers < ActiveRecord::Migration[6.1]
  has_many :user_histories
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :email
      t.boolean :admin, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
