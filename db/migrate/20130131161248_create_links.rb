class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.column :url, :string
      t.column :description, :text
      t.column :points, :integer, :default => 0
      t.timestamps
    end
  end
end
