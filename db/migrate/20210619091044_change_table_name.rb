class ChangeTableName < ActiveRecord::Migration[6.1]
  def change
    rename_table :authors_books, :author_books
  end 
end
