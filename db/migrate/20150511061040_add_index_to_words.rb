class AddIndexToWords < ActiveRecord::Migration
  def change
    add_index :words, :category_id
  end
end
