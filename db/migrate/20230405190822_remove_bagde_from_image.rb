class RemoveBagdeFromImage < ActiveRecord::Migration[6.1]
  def change
    remove_reference :images, :badge, index: true, foreign_key: true
  end
end
