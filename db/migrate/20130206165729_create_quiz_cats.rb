class CreateQuizCats < ActiveRecord::Migration
  def change
    create_table :quiz_cats do |t|
      t.integer :quiz_id
      t.integer :category_id

      t.timestamps
    end
  end
end
