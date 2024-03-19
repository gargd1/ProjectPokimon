class CreateForms < ActiveRecord::Migration[7.1]
  def change
    create_table :forms do |t|
      t.string :name
      t.references :pokimon_name, null: false, foreign_key: true

      t.timestamps
    end
  end
end
