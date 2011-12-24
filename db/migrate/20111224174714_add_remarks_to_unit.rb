class AddRemarksToUnit < ActiveRecord::Migration
  def change
    add_column :units, :remarks, :text
  end
end
