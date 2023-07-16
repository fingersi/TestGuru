class AddSuccessfullToTestPassing < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passings, :successfull, :boolean, default: false
  end
end
