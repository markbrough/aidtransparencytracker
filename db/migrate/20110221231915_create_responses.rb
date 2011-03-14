class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.integer :user_id
      t.integer :donor_id
      t.integer :recipient_id
      t.integer :response_type
      t.date :entry_date
      t.text :description
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
