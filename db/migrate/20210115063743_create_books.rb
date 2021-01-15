class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :image

      t.timestamps
    end

    create_table :ratings do |t|
      t.string :title
      t.float :rating
      t.references :books, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
