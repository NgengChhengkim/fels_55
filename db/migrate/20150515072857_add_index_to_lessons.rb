class AddIndexToLessons < ActiveRecord::Migration
  def change
    add_index :lessons, :user_id
    add_index :lessons, :category_id
    add_index :lessons, [:user_id, :category_id]
  end
end
