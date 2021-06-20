class ChangeColumnNameInAuthorsBooksTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :author_books, :authors_id, :author_id
    rename_column :author_books, :books_id, :book_id
  end
end
