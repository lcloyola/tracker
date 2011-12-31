class FixGroupsColumnName < ActiveRecord::Migration
  def up
    rename_column :groups, :in, :is_in
  end
end
