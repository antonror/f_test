class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :summary
      t.string :comment
      t.integer :stars
      t.integer :book_id

      t.timestamps
    end

    add_index :reviews, :book_id
  end
end
