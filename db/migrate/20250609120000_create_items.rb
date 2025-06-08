class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :code, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :items, :code, unique: true
  end
end
