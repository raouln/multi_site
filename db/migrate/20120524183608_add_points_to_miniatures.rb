class AddPointsToMiniatures < ActiveRecord::Migration
  def change
    add_column :miniatures, :points, :integer
  end
  
  def down
    remove_column :miniatures, :points
  end
end
