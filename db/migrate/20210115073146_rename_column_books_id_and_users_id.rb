class RenameColumnBooksIdAndUsersId < ActiveRecord::Migration[6.0]
  def change
    rename_column :ratings, :books_id, :book_id
    rename_column :ratings, :users_id, :user_id
  end
end
