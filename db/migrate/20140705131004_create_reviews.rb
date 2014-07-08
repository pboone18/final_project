class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :booktitle
      t.string :author
      t.string :bookthumb
      t.string :url
      t.integer :rating
      t.string :month
      t.integer :year
      t.string :chapter
      t.integer :membernum
      t.integer :gograting
      t.text :review
      t.text :questions
      t.boolean :recommend

      t.timestamps
    end
  end
end
