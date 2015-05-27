class CreateWordLessons < ActiveRecord::Migration
  def change
    create_table :word_lessons do |t|
      t.integer :lesson_id
      t.integer :word_id
      t.integer :answer_id

      t.timestamps null: false
    end
  end
end
