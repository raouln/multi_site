class CreateMiniatures < ActiveRecord::Migration
  
  def up
    create_table :miniatures do |t|
      t.string :name  
      t.string :war_type
      t.has_attached_file :picture
      t.timestamps
    end
  end
  
  def down
    drop_table :miniatures
  end
  
end
