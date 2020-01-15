class CreateTables < ActiveRecord::Migration[6.0]
  def change

    create_table :books do |t|
      t.string :name
      t.integer :price
      t.date :release_date

      t.references :create_user
      t.references :update_user
      t.timestamps
    end

    create_table :book_reviews do |t|
      t.references :book, foreign_key: true
      t.text :content

      t.references :create_user
      t.references :update_user
      t.timestamps
    end

  end
end
