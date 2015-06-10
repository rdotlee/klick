class ChangeKwestColumnName2 < ActiveRecord::Migration
  def change
    rename_column :kwests, :name, :trip
  end
end
