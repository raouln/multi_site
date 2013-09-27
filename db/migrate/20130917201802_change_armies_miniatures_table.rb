class ChangeArmiesMiniaturesTable < ActiveRecord::Migration
  def change
      rename_column :armies_miniatures, :miniature_id, :unit_id
      rename_table  :armies_miniatures, :armies_units
      change_column :units, :unit_type, :integer
      rename_column :units, :unit_type, :unit_type_id
  end
end
