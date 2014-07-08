class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :cmonth
      t.integer :cyear
      t.string :cchapter
      t.integer :cmembernum
      t.integer :cgograting
      t.text :creview
      t.text :cquestions
      t.boolean :crecommend

      t.timestamps
    end
  end
end
