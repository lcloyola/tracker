class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :details
      t.boolean :in, :default => true

      t.timestamps
    end
  end
end
