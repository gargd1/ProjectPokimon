class CreatePokimonNames < ActiveRecord::Migration[7.1]
  def change
    create_table :pokimon_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
