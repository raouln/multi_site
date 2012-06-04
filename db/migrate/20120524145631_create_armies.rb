class CreateArmies < ActiveRecord::Migration
  def up
    create_table :armies do |t|
      t.string  :name
      t.integer :user_id
      t.integer :points
      t.timestamps
    end
    add_column :miniatures, :army_id, :integer, :default => nil
  end
  
  def down
    drop_table :armies
    remove_column :miniatures, :army_id
  end
end
