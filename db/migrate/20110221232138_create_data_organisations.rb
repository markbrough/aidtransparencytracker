class CreateDataOrganisations < ActiveRecord::Migration
  def self.up
    create_table :data_organisations do |t|
      t.integer :question_id
      t.integer :published
      t.text :evidence
      t.text :comments
      t.integer :response_id
      t.date :entry_date

      t.timestamps
    end
  end

  def self.down
    drop_table :data_organisations
  end
end
