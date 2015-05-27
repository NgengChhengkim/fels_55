class AddForeignKeyToLessons < ActiveRecord::Migration
  def change
    add_foreign_key :lessons, :categories
    add_foreign_key :lessons, :users
  end
end
