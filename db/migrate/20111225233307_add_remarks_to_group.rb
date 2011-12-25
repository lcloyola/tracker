class AddRemarksToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :remarks, :text
  end
end
