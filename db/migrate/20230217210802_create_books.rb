class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :isbn13
      t.integer :num_pages
      t.date :publication_date
      t.decimal :price
      t.string :image_url
      t.references :language, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
