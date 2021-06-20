class CreateAuthorTable < ActiveRecord::Migration[6.1]
  def change
    create_table :authors, id: false do |t|
      t.integer :author_id
      t.string :first_name
      t.string :last_name
      t.datetime :date_of_birth

      t.timestamps
    end
  end
end
