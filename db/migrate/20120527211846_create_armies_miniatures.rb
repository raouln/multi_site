class CreateArmiesMiniatures < ActiveRecord::Migration
  def up
    create_table :armies_miniatures, :id => false do |t|
      t.references :army, :miniature
    end

    add_index :armies_miniatures, [:army_id, :miniature_id]
    
  end

  def down
    drop_table :armies_miniatures
  end
end
