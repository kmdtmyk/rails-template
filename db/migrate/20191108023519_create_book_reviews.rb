class CreateBookReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :book_reviews do |t|
      t.references :book, foreign_key: true
      t.text :content
      t.references :create_user

      t.timestamps
    end
  end
end
