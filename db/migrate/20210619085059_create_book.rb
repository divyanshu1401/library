class CreateBook < ActiveRecord::Migration[6.1]
  def change
    create_table :books, id: false do |t|
      t.integer :book_id
      t.string :book_title

      t.timestamps
    end
  end
end
