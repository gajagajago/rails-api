class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.timestamps
    end

    create_table :answers do |t|
      t.string :answer
      t.boolean :correct
      t.references :question, index: true
      t.timestamps
    end
  end
end
