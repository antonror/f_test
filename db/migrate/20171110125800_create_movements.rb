class CreateMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :movements do |t|
      t.string :taker_name
      t.datetime :taken_at
      t.datetime :returned_at
      t.integer :book_id

      t.timestamps
    end

    add_index :movements, :book_id
  end
end
