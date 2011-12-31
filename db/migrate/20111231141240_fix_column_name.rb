class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :units, :in, :is_in
  end
end
