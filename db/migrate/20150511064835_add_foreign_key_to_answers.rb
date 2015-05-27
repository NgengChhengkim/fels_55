class AddForeignKeyToAnswers < ActiveRecord::Migration
  def change
    add_foreign_key :answers, :words
  end
end
