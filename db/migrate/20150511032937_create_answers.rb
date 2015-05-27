class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :word_id
      t.string :meaning
      t.boolean :correct_answer, default: false

      t.timestamps null: false
    end
  end
end
