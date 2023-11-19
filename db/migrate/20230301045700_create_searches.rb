class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.decimal :min_price
      t.decimal :max_price
      t.integer :isbn13
      t.string :genre
      t.string :author
      t.string :publisher

      t.timestamps
    end
  end
end
