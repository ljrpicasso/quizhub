class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.integer :quiz_id
      t.date :release_date
      t.date :due_date
      t.boolean :active
      t.integer :released_by

      t.timestamps
    end
  end
end
