class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :keyword
      t.integer :lesson_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
