class RemovePicturePathFromBagde < ActiveRecord::Migration[6.1]
  def change
    remove_column :badges, :picture_path, :string
  end
end
