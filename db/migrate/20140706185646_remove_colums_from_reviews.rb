class RemoveColumsFromReviews < ActiveRecord::Migration
  def up
  	change_table :reviews do |t|
  		t.remove :month, :year, :chapter, :membernum, :gograting, :review, :questions, :recommend
  	end
  end

  def down
    add_column :reviews, :month, :string
	add_column :reviews, :year, :integer
	add_column :reviews, :chapter, :string
	add_column :reviews, :membernum, :integer
	add_column :reviews, :gograting, :integer
	add_column :reviews, :review, :text
	add_column :reviews, :questions, :text
	add_column :reviews, :recommend, :boolean
  end
end
