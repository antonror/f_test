class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :pages
      t.float :price
      t.string :genre
      t.string :description

      t.timestamps
    end
  end
end
