class AddForeignKeyToWordLessons < ActiveRecord::Migration
  def change
    add_foreign_key :word_lessons, :lessons
    add_foreign_key :word_lessons, :words
    add_foreign_key :word_lessons, :answers
  end
end
