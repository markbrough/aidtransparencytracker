class CreateDataCountries < ActiveRecord::Migration
  def self.up
    create_table :data_countries do |t|
      t.integer :question_id
      t.integer :published
      t.string :system
      t.text :evidence
      t.text :comments
      t.integer :response_id
      t.date :entry_date

      t.timestamps
    end
  end

  def self.down
    drop_table :data_countries
  end
end
