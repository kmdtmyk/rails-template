class CreateTables < ActiveRecord::Migration[6.0]
  def change

    create_table :notices, comment: 'お知らせ' do |t|
      t.string :title, comment: 'タイトル'
      t.text :body, comment: '本文'
      t.datetime :publish_start_datetime, comment: '公開開始日時'
      t.datetime :publish_end_datetime, comment: '公開終了日時'

      t.references :create_user, comment: '作成者id'
      t.references :update_user, comment: '更新者id'
      t.timestamps
    end

    create_table :items do |t|
      t.string :name
      t.string :search_name
      t.string :furigana
      t.string :search_furigana
      t.integer :price

      t.references :create_user
      t.references :update_user
      t.timestamps
    end

    create_table :orders do |t|
      t.date :date
      t.integer :total_price

      t.references :create_user
      t.references :update_user
      t.timestamps
    end

    create_table :order_details do |t|
      t.references :order, foreign_key: true
      t.references :item
      t.string :item_name
      t.integer :item_price
      t.integer :quantity
      t.integer :total_price

      t.timestamps
    end

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
