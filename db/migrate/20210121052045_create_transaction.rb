class CreateTransaction < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :title
      t.float :amount
      t.datetime :date
      t.timestamps
    end
  end
end
