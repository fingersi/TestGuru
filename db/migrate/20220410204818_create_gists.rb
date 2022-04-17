class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :user
      t.references :question
      t.string :link

      t.timestamps
    end
  end
end
