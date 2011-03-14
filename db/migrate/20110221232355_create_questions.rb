class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.text :question_long
      t.string :question_short
      t.text :description
      t.text :example
      t.integer :question_type

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
