class AddForeignKeytoReviews < ActiveRecord::Migration
  def change
  	add_reference :users, :chapter
  	add_reference :comments, :review
  end
end
