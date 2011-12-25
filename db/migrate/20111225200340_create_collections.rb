class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :group_id
      t.integer :unit_id

      t.timestamps
    end
    add_index :collections, :group_id
    add_index :collections, :unit_id
  end
end
