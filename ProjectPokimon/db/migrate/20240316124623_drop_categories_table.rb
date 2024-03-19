class DropCategoriesTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :categories
  end

  def down
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
  end
end

