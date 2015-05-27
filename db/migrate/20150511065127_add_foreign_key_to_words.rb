class AddForeignKeyToWords < ActiveRecord::Migration
  def change
    add_foreign_key :words, :categories
  end
end
