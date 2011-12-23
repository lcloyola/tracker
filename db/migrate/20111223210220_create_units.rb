class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.references :item
      t.text :details
      t.boolean :in
      t.boolean :active

      t.timestamps
    end
    add_index :units, :item_id
  end
end
