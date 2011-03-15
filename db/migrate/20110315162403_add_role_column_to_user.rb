class AddRoleColumnToUser < ActiveRecord::Migration
  def self.up
	add_column :users, :role, :string
	add_column :users, :organisation_name, :string
	add_column :users, :country_id, :integer
  end

  def self.down
	remove_column :users, :role
	remove_column :users, :organisation_name
	remove_column :users, :country_id
  end
end
