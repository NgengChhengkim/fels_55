class AddIndexToWordLessons < ActiveRecord::Migration
  def change
    add_index :word_lessons, :lesson_id
    add_index :word_lessons, :word_id
    add_index :word_lessons, :answer_id
    add_index :word_lessons, [:lesson_id, :word_id], unique: true
  end
end
