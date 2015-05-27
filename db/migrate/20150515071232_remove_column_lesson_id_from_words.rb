class RemoveColumnLessonIdFromWords < ActiveRecord::Migration
  def change
    remove_column :words, :lesson_id
  end
end
