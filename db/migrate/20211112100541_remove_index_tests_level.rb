class RemoveIndexTestsLevel < ActiveRecord::Migration[6.1]
  def change
    remove_index :tests, :level, unique: true
  end
end
