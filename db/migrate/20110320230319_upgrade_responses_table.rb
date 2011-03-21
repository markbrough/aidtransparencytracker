class UpgradeResponsesTable < ActiveRecord::Migration
  def self.up
	add_column :responses, :updated_date, :date
	add_column :responses, :submitted_date, :date
	add_column :responses, :related_to, :integer
  end

  def self.down
	remove_column :responses, :updated_date
	remove_column :responses, :submitted_date
	remove_column :responses, :related_to
  end
end
