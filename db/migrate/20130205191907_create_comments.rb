class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.text :commentary
      t.boolean :approved

      t.timestamps
    end
  end
end
