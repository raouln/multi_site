class ChangeWarTypeToUnitType < ActiveRecord::Migration
  def up
      rename_table :miniatures, :units
      rename_column :miniatures, :war_type, :unit_type
      create_table :unit_types do |t|
          t.string :name, :null => false
          t.timestamps
      end
  end

  def down
      rename_column :miniatures, :unit_type, :war_type  
      drop_table :unit_types
  end
end
