class AddRaceToMiniatures < ActiveRecord::Migration
  def change
    add_column :miniatures, :race_id, :integer
  end
end
