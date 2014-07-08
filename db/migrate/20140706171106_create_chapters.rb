class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :chaptername
      t.string :state
      t.references :user, index: true

      t.timestamps
    end
  end
end
