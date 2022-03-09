class AddTypeToUsers < ActiveRecord::Migration[6.1]
  def self.up
    add_column :users, :type, :string, null: false, default: 'User'

    User.all.each { |u| u.update_attribute(:type, (u.admin ? 'Admin' : 'User')) }

    remove_column :users, :admin
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end

  def self.down
    add_column :users, :admin, :boolean, null: false, default: false

    User.all.each { |u| u.update_attribute(:admin, u.type == 'Admin') }

    remove_column :users, :type
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end
