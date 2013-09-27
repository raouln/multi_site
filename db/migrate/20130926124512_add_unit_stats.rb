class AddUnitStats < ActiveRecord::Migration
  def up
    remove_column :units, :army_id
    create_table :unit_stats do |t|
        t.references :unit
        t.integer :move
        t.integer :weapon_skill
        t.integer :ballistic_skill
        t.integer :strength
        t.integer :toughness
        t.integer :initiative
        t.integer :wounds
        t.integer :attack
        t.integer :leadership
        t.timestamps
    end
    
  end
  
  def down
    add_column :units, :army_id, :integer
    drop_table :unit_stats
  end

end
