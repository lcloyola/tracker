class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.references :event
      t.references :group

      t.timestamps
    end
    add_index :packages, :event_id
    add_index :packages, :group_id
    add_index :packages, [ :event_id, :group_id], :unique =>true
  end
end
